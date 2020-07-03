# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :web_socket, WebSocketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GImDD0QN82T0vNB4ORI/UXLV8LTiXRwVLVEb4ftawSxDPzOHJ8O8Dfd8uRiRkYpk",
  render_errors: [view: WebSocketWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WebSocket.PubSub,
  live_view: [signing_salt: "tRX2nme2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
