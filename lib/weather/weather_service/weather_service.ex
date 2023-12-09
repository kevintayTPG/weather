defmodule Weather.WeatherService do
  @moduledoc """
  This module provides functions to get weather data with openweathermap API
  and geocode location using the geocoder api
  """
  alias Weather.Repo
  alias Weather.Geocoder
  alias Weather.OpenWeatherMap
  alias Weather.Queries.WeatherQueries
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
    case WeatherQueries.filter_by_name(Weather, location_name) do
      nil ->
        Weather
        |> Weather.changeset()
        |> Repo.insert()
      _ ->
        # Weather
        # |> Weather.update_changeset(weather)
        # |> Repo.update()
    end
  end
end
