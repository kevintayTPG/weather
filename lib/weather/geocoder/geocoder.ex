defmodule Weather.Geocoder do
@moduledoc """
This module provides functions to geocode location using the geocoder api
"""

def get_location(location) do
  with {:ok, location_data} <- get_location_data(location) do
    {:ok, location_data}
  else
    {:error, reason} ->
      {:error, reason}
  end
end

defp get_location_data(location) do
  with {:ok, response} <- Tesla.get!("https://openweathermap.org/6.2/geocode.json?apiKey=#{System.get_env("GEOCODER_API_KEY")}&searchtext=#{location}") do
    decoded_response = Jason.decode!(response.body, keys: :atoms!)
    {:ok, decoded_response}
  else
    {:error, reason} ->
      {:error, reason}
  end
end
end
