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
  def get_and_or_create_weather_by_location(%{location: location}) do
    with {:ok, location_data} <- Geocoder.get_location(location),
         {:ok, weather} <- OpenWeatherMap.get_the_weather(location_data) do
          maybe_create_weather(location, weather)
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Get weather by latitude and longitude
  """
  @spec get_and_or_create_weather_by_latlon(map()) :: map()
  def get_and_or_create_weather_by_latlon(args) do
    with {:ok, weather} <- OpenWeatherMap.get_the_weather(args) do
      maybe_create_weather(weather.name, weather)
      weather
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  # If location is already in the database, update otherwise create
  @spec maybe_create_weather(String.t(), map()) :: map()
  defp maybe_create_weather(location_name, weather) do
    case WeatherQueries.filter_by_name(location_name) |> Repo.one() do
      nil ->
        %Weather{}
        |> Weather.changeset()
        |> Repo.insert()
      result ->
        result
        |> Weather.update_changeset(weather)
        |> Repo.update()
    end
  end
end
