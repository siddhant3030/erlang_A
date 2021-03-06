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
  secret_key_base: "Skg6hxO18s7BgBt8wiuegJcAMSRsFq9frU1umthk5s8Tnv7Vz8D9MC4JdxvydRDn",
  render_errors: [view: VideoChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: VideoChat.PubSub,
  live_view: [signing_salt: "a97wKp4G"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
