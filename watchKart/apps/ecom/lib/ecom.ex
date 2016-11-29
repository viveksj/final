  defmodule Ecom do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [

      worker(Ecom.CostIncrementar, []),

      supervisor(Ecom.Repo, []),

      supervisor(Ecom.Endpoint, []),

    ]

    opts = [strategy: :one_for_one,
    name: Ecom.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Ecom.Endpoint.config_change(changed, removed)
    :ok
  end

  # defdelegate set(k, v), to: Kvp.Worker
  # defdelegate get(k), to: Kvp.Worker
  # defdelegate clear, to: Kvp.Worker
  #
end
