defmodule Furansulive.Repo.Migrations.CreateFlashcards do
  use Ecto.Migration

  def change do
    create table(:flashcards) do
      add :name, :string

      timestamps()
    end

  end
end
