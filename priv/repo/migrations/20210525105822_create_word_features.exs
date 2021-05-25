defmodule Furansulive.Repo.Migrations.CreateWordFeatures do
  use Ecto.Migration

  def change do
    create table(:word_feature) do
      add :feature, :string
      add :abbreviation, :string
      add :word_id, references(:words)
      timestamps()
    end
  end
end
