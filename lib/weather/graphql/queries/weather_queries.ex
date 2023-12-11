defmodule Weather.Graphql.Queries.WeatherQueries do
  @moduledoc """
  GraphQL queries for weather
  """
  use Absinthe.Schema.Notation

  alias Weather.Graphql.Resolvers.WeatherResolver

  object :weather do
    @desc "Get and create weather by city name"
    field :get_and_or_create_weather_by_location, :weather do
      arg(:location, non_null(:string))
      arg(:unit, :string, default_value: "standard")
      resolve(&WeatherResolver.get_and_or_create_weather_by_location/3)
    end

  @desc "Get and create weather by latitute and longitude"
  field :get_and_or_create_weather_by_latlon, :weather do
      arg(:lat, non_null(:float))
      arg(:lon, non_null(:float))
      resolve(&WeatherResolver.get_and_or_create_weather_by_latlon/3)
    end
  end


  end
