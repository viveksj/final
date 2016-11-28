defmodule CostIncrementar do
end
use Application

def start(_type, _args) do
  import Supervisor.Spec, warn: false

  children = [
    worker(Extra.GameServer, []),
    ]

  opts = [strategy: :one_for_one, name: Extra.Supervisor]
  Supervisor.start_link(children, opts)
end
end
