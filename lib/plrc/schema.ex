defmodule PLRC.Schema do
  use Ecto.Schema

  @primary_key false
  schema "plrc_repl" do
    field :message, :string
  end
end
