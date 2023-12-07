defmodule Weather.WeatherService do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  and geocode location using the geocoder api
  """
alias Weather.Geocoder
alias Weather.OpenWeatherMap


  def get_weather_by_location(args) do
    with {:ok, location_data} <- Geocoder.get_location(args.location),
         {:ok, weather} <- OpenWeatherMap.get_the_weather(location_data) do
      weather
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

end
