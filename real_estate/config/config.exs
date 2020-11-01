# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_estate,
  ecto_repos: [RealEstate.Repo]

# Configures the endpoint
config :real_estate, RealEstateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1oLD7rUIGk5YbcdZF/OWW2qfWgEXVi+/sXv9TwRXBKJ0s1CX1cC2jf7pqNLMSRkR",
  render_errors: [view: RealEstateWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealEstate.PubSub,
  live_view: [signing_salt: "AV7S5OXS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
