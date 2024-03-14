defmodule Weather.WeatherResolverTest do
  @moduledoc """
  Weather resolver test
  """
  use ExUnit.Case
  use Mimic

  describe "get_and_or_create_weather_by_location/3" do
    test "returns weather data" do
      Mimic.expect(Tesla, :get, fn url, _params ->
      assert  end)

    end

    test "returns error" do
      assert {:error, _} = WeatherResolver.get_and_or_create_weather_by_location(nil, %{location: "100000000000000000.0", unit: "imperial"}, nil)
    end
  end

end
