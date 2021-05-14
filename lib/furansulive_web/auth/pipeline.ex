defmodule FuransuliveWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :furansulive,
    module: FuransuliveWeb.Auth.Guardian,
    error_handler: FuransuliveWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
