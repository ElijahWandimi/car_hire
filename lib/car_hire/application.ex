defmodule CarHire.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CarHireWeb.Telemetry,
      CarHire.Repo,
      {DNSCluster, query: Application.get_env(:car_hire, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CarHire.PubSub},
      # Start a worker by calling: CarHire.Worker.start_link(arg)
      # {CarHire.Worker, arg},
      # Start to serve requests, typically the last entry
      CarHireWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CarHire.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CarHireWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
