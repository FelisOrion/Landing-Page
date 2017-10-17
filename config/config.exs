# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :landing,
  ecto_repos: [Landing.Repo]

# Configures the endpoint
config :landing, LandingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QDxoz9Exsi08/30d/xpkPDPodXhBSpjG30Alx55BAMgvy6GaJcTs7yxR6uXThlPJ",
  render_errors: [view: LandingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Landing.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
