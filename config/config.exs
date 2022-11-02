import Config

config :plrc, ecto_repos: [PLRC.Repo]

config :plrc, PLRC.Repo,
  pool_size: 2,
  database: "plrc_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5433"
