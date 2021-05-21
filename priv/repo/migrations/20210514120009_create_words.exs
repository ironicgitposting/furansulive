defmodule Furansulive.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :unit, :string
      add :meaning, :text
      add :type, :string
      timestamps()
    end

  end
end
