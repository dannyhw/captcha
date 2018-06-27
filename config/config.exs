# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :captcha,
  ecto_repos: [Captcha.Repo]

# Configures the endpoint
config :captcha, CaptchaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ok81weHUY5vHaTNt5w+kz528EJUSZHGFEVW/LUhli5tD7m3xft6saoT6B6Aak9vW",
  render_errors: [view: CaptchaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Captcha.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Hound config
config :hound, driver: "phantomjs"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


