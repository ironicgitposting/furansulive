defmodule FuransuliveWeb.Router do
  use FuransuliveWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  pipeline :auth do
    plug FuransuliveWeb.Auth.Pipeline
  end

  scope "/api", FuransuliveWeb do
    # Open Endpoints
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", FuransuliveWeb do
    # Auth Protected Endpoints
    # Mostly read only resources
    pipe_through [:api, :auth]
    resources "/words", WordController, only: [:index, :show]
  end

  scope "/admin/api", FuransuliveWeb do
    # Administration Dashboard Endpoints
    pipe_through [:api, :auth, FuransuliveWeb.Auth.Admin]
    resources "/words", WordController
  end

  # Fallback from browser
  scope "/", FuransuliveWeb do
    pipe_through :browser
    get "/", DefaultController, :index
    get "/*path", DefaultController, :redirect_to_root
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  # if Mix.env() in [:dev, :test] do
  #  scope "/" do
  #    pipe_through [:fetch_session, :protect_from_forgery]
  #    live_dashboard "/dashboard", metrics: FuransuliveWeb.Telemetry
  #  end
  # end
end
