defmodule FuransuliveWeb.DefaultController do
  use FuransuliveWeb, :controller

  def index(conn, _params) do
    text(conn, "Furansugo Live!")
  end
end
