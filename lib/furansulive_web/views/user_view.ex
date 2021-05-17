defmodule FuransuliveWeb.UserView do
  use FuransuliveWeb, :view
  alias FuransuliveWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
  end

  def render("public_index.json", %{users: users}) do
    %{data: render_many(users, UserView, "public_user.json")}
  end

  def render("public_user.json", %{user: user}) do
    %{
      email: user.email
    }
  end
end
