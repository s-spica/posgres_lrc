# PLRC

For testing postgres logical replication

```sh
docker compose -f docker-compose.yml up
mix do deps.get, ecto.create, ecto.migrate
iex -S mix
> PLRC.insert
18:41:02.549 [info] [commit_timestamp: 720729662553818, final_lsn: 25858648, xid: 819]
18:41:02.549 [info] [column_name: "message", id: 24608]
18:41:02.549 [debug] QUERY OK db=4.8ms queue=1.6ms idle=1455.7ms
INSERT INTO "plrc_repl" ("message") VALUES ($1) ["2022-11-02T18:41:02.542169Z"]
18:41:02.549 [info] [id: 24608, tuple_data: %{length_of_column_value: 27, number_of_columns: 1, value: "2022-11-02T18:41:02.542169Z"}]
18:41:02.551 [info] [end_lsn: 25858696, flag: 0, lsn: 25858648, timestamp: 720729662553818]
# to do all over again
> PLRC.down
> PLRC.up
```
