defmodule Weather.Graphql.Queries.WeatherQueries do
  @moduledoc """
  GraphQL queries for weather
  """
  use Absinthe.Schema.Notation

  alias Weather.Graphql.Resolvers.WeatherResolver

  object :weather do
    @desc "Get weather by location info"
    field :get_weather_by_location, :weather do
      arg :location, non_null(:string)
      arg :unit, :string, default_value: "standard"
      resolve(&WeatherResolver.get_weather_by_location/3)


    end
  end
end
