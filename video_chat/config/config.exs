# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :video_chat,
  ecto_repos: [VideoChat.Repo]

# Configures the endpoint
config :video_chat, VideoChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AHJtTHEmgne3zb/MEZm3ox2pj23t1zOCvH5szaWK6MK5qU095wdheamBQtXnTdE+",
  render_errors: [view: VideoChatWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: VideoChat.PubSub,
  live_view: [signing_salt: "aKX+T/5z"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
