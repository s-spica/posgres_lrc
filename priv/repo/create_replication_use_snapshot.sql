-- PGPASSWORD=postgres psql "host=127.0.0.1 port=5433 user=postgres dbname=plrc_dev replication=database"
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
  CREATE_REPLICATION_SLOT plrc_use LOGICAL pgoutput USE_SNAPSHOT;
END;
