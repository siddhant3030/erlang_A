# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kaffy,
  otp_app: :auth,
  ecto_repo: Auth.Repo,
  router: AuthWeb.Router

config :money,
  # this allows you to do Money.new(100)
  default_currency: :EUR,
  # change the default thousands separator for Money.to_string
  separator: ".",
  delimiter: ","

config :auth,
  ecto_repos: [Auth.Repo]

# Configures the endpoint
config :auth, AuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UeT8vzaiiQCCgfozqYT69ENN700/V28mXzWBfr+zuidFlmM/oxHmSQYTO+mNnASI",
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Auth.PubSub,
  live_view: [signing_salt: "2Wdr2QkJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
