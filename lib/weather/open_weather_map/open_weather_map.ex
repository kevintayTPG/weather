defmodule Weather.OpenWeatherMap do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  """

  # TODO: location_data is in json. Does need to be converted before we give it to the API?
  def get_the_weather(location_data) do
    with response <-
           Tesla.get!(
             "https://api.openweathermap.org/data/2.5/onecall?lat=#{location_data["latitude"]}&lon=#{location_data["longitude"]}&exclude=minutely,hourly&appid=#{System.get_env("OPEN_WEATHER_MAP_API_KEY")}&units=metric"
           ) do
      decoded_response = Jason.decode!(response.body, keys: :atoms!)
      {:ok, decoded_response}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end
end
