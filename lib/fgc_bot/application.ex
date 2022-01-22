defmodule FgcBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FgcBot.Repo,
      # Start the Telemetry supervisor
      FgcBotWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FgcBot.PubSub},
      # Start the Endpoint (http/https)
      FgcBotWeb.Endpoint
      # Start a worker by calling: FgcBot.Worker.start_link(arg)
      # {FgcBot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FgcBot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FgcBotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
