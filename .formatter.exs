[
  import_deps: [:ecto, :phoenix],
  inputs: [
    "mix.exs",
    "apps/*/mix.exs",
    "apps/*/{config,lib,test}/**/*.{ex,exs}",
    "*.{ex,exs}",
    "priv/*/seeds.exs",
    "scripts/*.exs"
  ],
  subdirectories: [
    "apps/*",
    "priv/*/migrations"
  ],
  line_length: 120
]
