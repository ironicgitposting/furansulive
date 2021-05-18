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

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "public_index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "public_show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "public_show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
