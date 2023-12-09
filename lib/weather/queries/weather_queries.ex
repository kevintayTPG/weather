defmodule Weather.Queries.WeatherQueries do
  @moduledoc """
  Weather queries
  """
  alias Ecto.Queryable

  import Ecto.Query, except: [limit: 2]

  @spec filter_by_name(Queryable.t(), String.t()) :: Queryable.t()
  def filter_by_name(query, name) do
    from(w in query,
      where: w.name == ^name)
  end

  def get_all_weather(query) do
    from(w in query,
      select: w)
  end
end
