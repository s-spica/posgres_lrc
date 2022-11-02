defmodule PLRC do
  require Logger

  alias PLRC.Schema
  alias PLRC.Repo

  def up do
    # temporary table not supported for logical replication
    Repo.query!("""
    CREATE TABLE IF NOT EXISTS plrc_repl(
      message TEXT
    );
    """)

    Repo.query!("""
    CREATE PUBLICATION plrc FOR TABLE plrc_repl;
    """)
  end

  def down do
    Repo.query!("""
    DROP PUBLICATION IF EXISTS plrc;
    """)

    Repo.query!("""
    DROP TABLE IF EXISTS plrc_repl;
    """)
  end

  def insert do
    message = DateTime.utc_now() |> DateTime.to_iso8601()
    Repo.insert!(%Schema{message: message})
  end
end
