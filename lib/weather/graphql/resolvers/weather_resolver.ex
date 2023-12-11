defmodule Weather.Graphql.Resolvers.WeatherResolver do
  @moduledoc """
  Weather resolver
  """

  alias Weather.WeatherService

  @doc """
  Get weather by location info
  """
  @spec get_and_or_create_weather_by_location(any(), map(), any()) :: map()
  def get_and_or_create_weather_by_location(_parent, args, _resolution) do
    WeatherService.get_and_or_create_weather_by_location(args)
  end

  def get_and_or_create_weather_by_latlon(_parent, args, _resolution) do
    WeatherService.get_and_or_create_weather_by_latlon(args)
  end
end
