defmodule PLRC do
  require Logger

  alias PLRC.Schema
  alias PLRC.Repo

  def up do
    Ecto.Migrator.run(Repo, :up, all: true)
  end

  def down do
    Ecto.Migrator.run(Repo, :down, all: true)
  end

  def insert do
    message = DateTime.utc_now() |> DateTime.to_iso8601()
    Repo.insert!(%Schema{message: message})
  end
end
