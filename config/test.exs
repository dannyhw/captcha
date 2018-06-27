use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :captcha, CaptchaWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :captcha, Captcha.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "admin",
  password: "UE6eFDnkWb2T",
  database: "captcha_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

