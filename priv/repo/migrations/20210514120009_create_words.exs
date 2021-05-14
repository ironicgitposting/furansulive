defmodule Furansulive.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :name, :string
      add :description, :text
      add :tag, :string

      timestamps()
    end

  end
end
