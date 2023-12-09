defmodule Weather.OpenWeatherMap.OpenWeatherMapTest do
  @moduledoc """
  OpenWeatherMap test
  """
  use ExUnit.Case
  alias Weather.OpenWeatherMap

  describe "get_the_weather/1" do
    test "returns weather data" do
      response = elem(OpenWeatherMap.get_the_weather(%{lat: 37.7790262, lon: -122.419906}), 1)
      assert response.name == "San Francisco"

    end

    test "returns error" do
      assert {:error, _} = OpenWeatherMap.get_the_weather(%{lat: 100000000000000000.0, lon: 1000000000000000.0})
    end
  end

end
