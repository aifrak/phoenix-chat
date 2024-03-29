[
  import_deps: [:ecto, :ecto_sql, :phoenix],
  line_length: 98,
  subdirectories: ["priv/*/migrations"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.exs",
    "*.{heex,ex,exs}",
    "{config,lib,test}/**/*.{heex,ex,exs}",
    "priv/*/seeds.exs",
    ".sobelow-conf"
  ]
]
