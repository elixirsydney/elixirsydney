# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo13,
  ecto_repos: [Demo13.Repo]

# Configures the endpoint
config :demo13, Demo13.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LlpEdWuu65WUQ5gJpSRSYeBObcLGMvcPyUbtXJSK1ba619lo5ENDNkbf2d/4kSUK",
  render_errors: [view: Demo13.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Demo13.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
