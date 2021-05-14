defmodule Furansulive.Repo do
  use Ecto.Repo,
    otp_app: :furansulive,
    adapter: Ecto.Adapters.Postgres
end
