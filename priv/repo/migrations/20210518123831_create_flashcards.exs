defmodule Furansulive.Repo.Migrations.CreateFlashcards do
  use Ecto.Migration

  def change do
    create table(:flashcards) do
      add :name, :string
      add :target_language, :string
      add :target_language_pronunciation, :string
      add :target_language_sound_file_path, :string
      add :target_language_meaning, :string
      add :source_language_meaning, :string
      add :target_language_picture_file_path, :string
      add :target_language_notes, :string
      add :flashcard_type, :integer

      timestamps()
    end

  end
end
