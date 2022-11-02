defmodule PLRC.Repo do
  use Ecto.Repo,
    otp_app: :plrc,
    adapter: Ecto.Adapters.Postgres
end
