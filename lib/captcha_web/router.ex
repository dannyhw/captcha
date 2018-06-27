defmodule CaptchaWeb.Router do
  use CaptchaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CaptchaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", CaptchaController, :index

  end

  # Other scopes may use custom stacks.
  # scope "/api", CaptchaWeb do
  #   pipe_through :api
  # end
end
