defmodule Weather.Schemas.Weather do
  @moduledoc """
  Weather schema
  """
  use Ecto.Schema
  alias Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  schema "weather" do
    field :description, :string
    field :icon, :string
    field :temp, :float
    field :feels_like, :float
    field :temp_min, :float
    field :temp_max, :float
    field :pressure, :integer
    field :humidity, :integer
    field :name, :string
  end


  @spec all_fields() :: list()
  defp all_fields() do
    __MODULE__.__schema__(:fields)
  end

  @doc """
  Builds a changeset based on the `weather` schema and `attrs`.
  """
  def changeset(attrs) do
    %__MODULE__{}
    |> Changeset.cast(attrs, all_fields())
    |> Changeset.unique_constraint(:name, message: "Weather for this location already exists")
    |> Changeset.validate_required([:name, :temp, :feels_like])
  end

  @spec update_changeset(Weather.t(), map()) :: Changeset.t()
  def update_changeset(weather, attrs) do
    weather
    |> Changeset.cast(attrs, all_fields())
    |> Changeset.validate_required([:name, :temp, :feels_like])
  end

end
