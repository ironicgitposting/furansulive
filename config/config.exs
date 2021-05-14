# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :furansulive,
  ecto_repos: [Furansulive.Repo]

# Configures the endpoint
config :furansulive, FuransuliveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KrtLu5C+EcJsUU7nh8M/IYpOw1s8F2XPj0k9wgSCFr3CNGv3tKEGZTdTBqouDJH1",
  render_errors: [view: FuransuliveWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Furansulive.PubSub,
  live_view: [signing_salt: "Ed6jbW/y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :furansulive, FuransuliveWeb.Auth.Guardian,
  issuer: "furansulive",
  secret_key: "xsk/v5EZk31UMTHZgVsAFv/MPJPDyTP+ii8zbhtzLov6hSDvBkvpsjLvtrWLPM4x"
