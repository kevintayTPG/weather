defmodule Weather.WeatherService do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  and geocode location using the geocoder api
  """
  alias Weather.Geocoder
  alias Weather.OpenWeatherMap
  alias Weather.Schemas.Weather

  @doc """
  Get weather by location name
  """
  @spec get_and_or_create_weather_by_location(map()) :: map()
  def get_and_or_create_weather_by_location(args) do
    with {:ok, location_data} <- Geocoder.get_location(args.location),
         {:ok, weather} <- OpenWeatherMap.get_the_weather(location_data) do
          maybe_create_weather(args.location, weather)
      weather
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def maybe_create_weather(location_name, weather) do
    case Repo.get_by(Weather, weather_id: weather.weather.id) do
      nil ->
        Repo.insert!(%Weather{
          name: location_name,
          description: weather.weather.description,
          icon: weather.weather.icon,
          temp: weather.temps.temp,
          feels_like: weather.temps.feels_like,
          temp_min: weather.temps.temp_min,
          temp_max: weather.temps.temp_max,
          pressure: weather.temps.pressure,
          humidity: weather.temps.humidity
        })
      _ ->
        {:ok, "Weather already exists"}
    end
  end
end
