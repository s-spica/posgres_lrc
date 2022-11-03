defmodule PLRC.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PLRC.Repo,
      {PLRC.Repl, Application.get_env(:plrc, PLRC.Repo) ++ [name: PLRC.Repl]}
      # Starts a worker by calling: PLRC.Worker.start_link(arg)
      # {PLRC.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PLRC.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
