defmodule JitsJournal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      JitsJournalWeb.Telemetry,
      JitsJournal.Repo,
      {DNSCluster, query: Application.get_env(:jits_journal, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: JitsJournal.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: JitsJournal.Finch},
      # Start a worker by calling: JitsJournal.Worker.start_link(arg)
      # {JitsJournal.Worker, arg},
      # Start to serve requests, typically the last entry
      JitsJournalWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JitsJournal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JitsJournalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
