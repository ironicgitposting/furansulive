defmodule FuransuliveWeb.UserController do
  use FuransuliveWeb, :controller

  alias Furansulive.Accounts
  alias Furansulive.Accounts.User
  alias FuransuliveWeb.Auth.Guardian

  action_fallback FuransuliveWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)

    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    IO.inspect(Guardian.authenticate(email, password))

    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end
end
