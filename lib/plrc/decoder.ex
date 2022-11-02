defmodule PLRC.Decoder do
  @moduledoc """
  https://www.postgresql.org/docs/14/protocol-replication.html
  https://www.postgresql.org/docs/14/protocol-logicalrep-message-formats.html
  """

  def decode(<<"B", final_lsn::integer-64, timestamp::integer-64, xid::integer-32>>) do
    %{
      final_lsn: final_lsn,
      commit_timestamp: timestamp,
      xid: xid
    }
  end

  def decode(
        <<"C", flag::integer-8, lsn::integer-64, end_lsn::integer-64, timestamp::integer-64>>
      ) do
    %{
      flag: flag,
      lsn: lsn,
      end_lsn: end_lsn,
      timestamp: timestamp
    }
  end

  def decode(<<"R", id::integer-32, rest::binary>>) do
    [
      _namespace,
      _relation_name
      | [
          <<_replica_id::integer-8, _number_of_columns::integer-16, _flag::integer-8,
            rest::binary>>
        ]
    ] = String.split(rest, <<0>>, parts: 3)

    [column_name, <<_column_id::integer-32, _type_modifier::integer-32>>] =
      String.split(rest, <<0>>, parts: 2)

    %{
      id: id,
      column_name: column_name
    }
  end

  def decode(<<"I", id::integer-32, "N", tuple_data::binary>>) do
    %{
      id: id,
      tuple_data: decode_tuple(tuple_data)
    }
  end

  defp decode_tuple(
         <<number_of_columns::integer-16, "t", length_of_column_value::integer-32, value::binary>>
       ) do
    %{
      number_of_columns: number_of_columns,
      length_of_column_value: length_of_column_value,
      value: value
    }
  end
end
