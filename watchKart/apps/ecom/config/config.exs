# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ecom,
  ecto_repos: [Ecom.Repo]

# Configures the endpoint
config :ecom, Ecom.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bagVrB0D++jMs1evbVkc5xt5Lkf1SXVLt6znwJaaWslW0dM9qUd4VLhMxBfBlldv",
  render_errors: [view: Ecom.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ecom.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
