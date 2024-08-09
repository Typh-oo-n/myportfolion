defmodule Myportfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyportfolioWeb.Telemetry,
      Myportfolio.Repo,
      {DNSCluster, query: Application.get_env(:myportfolio, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Myportfolio.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Myportfolio.Finch},
      # Start a worker by calling: Myportfolio.Worker.start_link(arg)
      # {Myportfolio.Worker, arg},
      # Start to serve requests, typically the last entry
      MyportfolioWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Myportfolio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyportfolioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
