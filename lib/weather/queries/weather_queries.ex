defmodule Weather.Queries.WeatherQueries do
  @moduledoc """
  Weather queries
  """

  import Ecto.Query, except: [limit: 2]

  alias Weather.Schemas.Weather

  def filter_by_name(name) do
    from(w in Weather,
      where: w.name == ^name)
  end

  def get_all_weather() do
    from(w in Weather,
      select: w)
  end
end
