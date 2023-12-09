defmodule Weather.Geocoder do
@moduledoc """
This module provides functions to geocode location using the geocoder api
"""
@api_key System.get_env("OPENWEATHER_API_KEY")
@geocoder_path "http://api.openweathermap.org/geo/1.0/direct?q="


def get_location(location) do
  location = String.replace(location, " ", "+")
  response = Tesla.get!(@geocoder_path <> location <> "&appid=#{@api_key}")
    if response.body != "[]" do
      {:ok, decode_response(response)}
    else
      {:error, "No response"}
    end
  end

  def decode_response(response) do
    decoded_response_list =Jason.decode!(response.body, keys: :atoms)
    decoded_response_map = Enum.at(decoded_response_list, 0)
    %{lat: decoded_response_map.lat, lon: decoded_response_map.lon}
  end
end
