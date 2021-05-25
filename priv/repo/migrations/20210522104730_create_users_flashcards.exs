defmodule Furansulive.Repo.Migrations.CreateUsersFlashcards do
  use Ecto.Migration

  def change do
    create table(:user_flashcard, primary_key: false) do
      add :flashcard_id, references(:flashcards, on_delete: :delete_all), primary_key: true
      add :user_id, references(:users, on_delete: :delete_all), primary_key: true
      add :date_last_display, :utc_datetime
      add :quality, :integer
      add :repetitions, :integer
      add :previous_ease_factor, :float
      add :previous_interval, :integer
      timestamps()
    end

    create(index(:user_flashcard, [:flashcard_id]))
    create(index(:user_flashcard, [:user_id]))
  end
end
