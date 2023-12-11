defmodule Weather.WeatherService.WeatherServiceTest do
  @moduledoc"""
    Weather service test
    """

    use ExUnit.Case
    alias Weather.WeatherService

    describe "get_and_or_create_weather_by_location/1" do
      test "returns weather data" do
        response = WeatherService.get_and_or_create_weather_by_location(%{location: "San Francisco, California"})
        assert response.name == "San Francisco"
        assert !is_nil(response.weather)
        assert !is_nil(response.temps)
        assert !is_nil(response.temps.feels_like)
        assert !is_nil(response.temps.temp)
      end

      test "returns error" do
        assert {:error, _} = WeatherService.get_and_or_create_weather_by_location(%{location: "Tristram, Khanduras"})
      end
    end

    describe "get_and_or_create_weather_by_latlon/1" do
      test "returns weather data" do
        response = WeatherService.get_and_or_create_weather_by_latlon(%{lat: 37.7790262, lon: -122.419906})
        assert response.name == "San Francisco"
        assert !is_nil(response.weather)
        assert !is_nil(response.temps)
        assert !is_nil(response.temps.feels_like)
        assert !is_nil(response.temps.temp)
      end

      test "returns error" do
        assert {:error, _} = WeatherService.get_and_or_create_weather_by_latlon(%{lat: 100000000000000000.0, lon: 1000000000000000.0})
      end
    end


end
