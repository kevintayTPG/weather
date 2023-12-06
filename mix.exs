defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Weather.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto , " ~> 3.7"},
      {:postgrex, " >= 0.0.0"},
      {:ecto_sql, "~> 3.7"},
      {:absinthe, "~> 1.7"},
      {:absinthe_phoenix, "~> 2.0"},
    ]
  end
end
