defmodule Weather.Geocoder.GeocoderTest do
  @moduledoc """
  Geocoder test
  """
  use ExUnit.Case
  alias Weather.Geocoder

  describe "get_location/1" do
    test "returns location data" do
      assert {:ok, %{lat: 37.7790262, lon: -122.419906}} = Geocoder.get_location("San Francisco, California")
    end

    test"returns error" do
      assert {:error, "No response"} = Geocoder.get_location("Tristram, Khanduras")
    end
  end
end
