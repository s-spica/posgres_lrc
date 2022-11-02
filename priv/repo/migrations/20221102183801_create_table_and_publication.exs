defmodule PLRC.Repo.Migrations.CreateTableAndPublication do
  use Ecto.Migration

  def up do
    # temporary table not supported for logical replication
    create table(:plrc_repl, primary_key: false) do
      add :message, :text
    end

    execute """
    CREATE PUBLICATION plrc FOR TABLE plrc_repl;
    """
  end

  def down do
    execute """
    DROP PUBLICATION IF EXISTS plrc;
    """

    drop table(:plrc_repl)
  end
end
