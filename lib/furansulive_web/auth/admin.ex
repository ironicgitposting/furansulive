defmodule FuransuliveWeb.Auth.Admin do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user = Guardian.Plug.current_resource(conn)
    IO.inspect(user)

    case user.admin do
      true ->
        conn

      _ ->
        body = Poison.encode!(%{error: "not admin"})

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, body)
    end
  end
end
