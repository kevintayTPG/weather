defmodule Weather.Geocoder do
@moduledoc """
This module provides functions to geocode location using the geocoder api
"""

@geocoder_path "https://geocode.maps.co/search?q="

def get_location(location) do
  with {:ok, location_data} <- get_location_data(location) do
    {:ok, location_data}
  else
    {:error, reason} ->
      {:error, reason}
  end
end

defp get_location_data(location) do
  response = Tesla.get!(@geocoder_path <> location)
    if response != nil do
      {:ok, response}
    else
      {:error, "No response"}
    end
  end
end
