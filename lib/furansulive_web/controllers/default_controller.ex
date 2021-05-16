defmodule FuransuliveWeb.DefaultController do
  use FuransuliveWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> json(%{data: "You are not supposed to be here!"})
  end

  def redirect_to_root(conn, _params) do
    conn |> redirect(to: "/")
  end
end
