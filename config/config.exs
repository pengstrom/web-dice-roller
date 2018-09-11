# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :web_dice_roller, WebDiceRollerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cw8W5lYOLlvn7MgSguM7RaBvA8ywmFyJS6Csc0vyQN6gvNwS2NCt3y8Bmkv72E/4",
  render_errors: [view: WebDiceRollerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WebDiceRoller.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
