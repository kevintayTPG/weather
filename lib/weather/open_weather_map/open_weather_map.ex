defmodule Weather.OpenWeatherMap do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  """

  @api_key System.get_env("OPENWEATHER_API_KEY")

  @open_weather_map_path "https://api.openweathermap.org/data/2.5/weather?"

  @doc """
  Get the weather by latitude and longitude within a map
  """
  @spec get_the_weather(map()) :: map()
  def get_the_weather(location_data) do
    response = Tesla.get!(@open_weather_map_path <> "lat=#{location_data.lat}&lon=#{location_data.lon}&units=imperial&appid=#{@api_key}")
    if Map.has_key?(response, :status) do
    case response.status do
      200 ->
      decoded_response = decode_response(response)
      {:ok, %{
        name: decoded_response.name,
        weather: if is_list(decoded_response.weather) do
          Enum.at(decoded_response.weather, 0)
        else
          decoded_response.weather
        end,
      temps: decoded_response.main}}
      400 ->
      {:error, decode_response(response).message}

      _ ->
      {:error, "Unknown error"}
      end

      else
      {:error, "No response from API"}
    end
  end

  defp decode_response(response) do
    Jason.decode!(response.body, keys: :atoms)
end
end
