# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo12,
  ecto_repos: [Demo12.Repo]

# Configures the endpoint
config :demo12, Demo12.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QtxQRbvkZFRpr6VxLAXJL+qWDcPWty72E0bIc4P40G3ixhNDxe1mtHyVkqGC5rg7",
  render_errors: [view: Demo12.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Demo12.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
