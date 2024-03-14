defmodule Weather.Geocoder do
@moduledoc """
This module provides functions to geocode location using the geocoder api
"""
@api_key System.get_env("OPENWEATHER_API_KEY")
@geocoder_path "http://api.openweathermap.org/geo/1.0/direct?q="

@spec get_location(String.t()) :: {:ok, map()} | {:error, String.t()}
def get_location(location) do
  parsed_location = String.replace(location, " ", "+")

  with {:ok, %{body: body, status: status} = _response} <-
    Tesla.get(@geocoder_path <> parsed_location <> "&appid=#{@api_key}"),
  {:ok, decoded_body} <- Jason.decode(body, keys: :atoms) do
    case status do
      200 ->
        {:ok, decoded_body}
      _ ->
        {:error, %{status: decoded_body.cod, message: decoded_body.message}}

      end
    else
      {:error, _} ->
        {:error, "unknown error"}

  end
end
end
