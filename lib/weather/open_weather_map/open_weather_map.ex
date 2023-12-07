defmodule Weather.OpenWeatherMap do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  """

  @api_key System.get_env("OPENWEATHER_API_KEY")

  @open_weather_map_path "https://api.openweathermap.org/data/2.5/weather?q="
  # TODO: location_data is in json. Does need to be converted before we give it to the API?
  def get_the_weather(location_data) do
    response = Tesla.get!(@open_weather_map_path <> location_data)
    if response != nil do
      decoded_response = Jason.decode!(response.body, keys: :atoms!)
      {:ok, decoded_response}
    else
      {:error, reason}
      end
    end

    defp get_api_key(file_path) do
      case File.read(file_path) do
        {:ok, contents} ->
          contents
        {:error, reason} ->
          {:error, reason}
      end
    end
  end
