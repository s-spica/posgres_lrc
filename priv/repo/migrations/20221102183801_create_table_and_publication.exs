defmodule PLRC.Repo.Migrations.CreateTableAndPublication do
  use Ecto.Migration

  def up do
    # temporary table not supported for logical replication
    execute """
    CREATE TABLE IF NOT EXISTS plrc_repl(
      message TEXT
    );
    """

    execute """
    CREATE PUBLICATION plrc FOR TABLE plrc_repl;
    """
  end

  def down do
    execute """
    DROP PUBLICATION IF EXISTS plrc;
    """

    execute """
    DROP TABLE IF EXISTS plrc_repl;
    """
  end
end
