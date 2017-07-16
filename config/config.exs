# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :don_m,
  ecto_repos: [DonM.Repo]

# Configures the endpoint
config :don_m, DonM.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F5iLE5wUiKRdQFlZGpGbouWxSZRdrGdf8D5jKPozXSepXbKdErK2UdnUyg5Q24DH",
  render_errors: [view: DonM.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DonM.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
