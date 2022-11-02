import Config

config :plrc, PLRC.Repo,
  pool_size: 1,
  database: "plrc_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5433"
