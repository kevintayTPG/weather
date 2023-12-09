defmodule Weather.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :description, :string
      add :icon, :string
      add :temp, :float
      add :feels_like, :float
      add :temp_min, :float
      add :temp_max, :float
      add :pressure, :integer
      add :humidity, :integer
      add :name, :string
    end

    create unique_index(:weather, [:name])
  end
end
