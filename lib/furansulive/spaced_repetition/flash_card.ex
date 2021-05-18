defmodule Furansulive.SpacedRepetition.FlashCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias Furansulive.Directory.Word

  schema "flashcards" do
    field :target_language, :string
    field :target_language_pronunciation, :string
    field :target_language_sound_file_path, :string
    field :target_language_meaning, :string
    field :source_language_meaning, :string
    field :target_language_picture_file_path, :string
    field :target_language_notes, :string
    field :flashcard_type, :integer
    belongs_to(:word, Word)
    timestamps()
  end

  @doc false
  def changeset(flash_card, attrs) do
    flash_card
    |> cast(attrs, [
      :target_language,
      :target_language_pronunciation,
      :target_language_sound_file_path,
      :target_language_meaning,
      :source_language_meaning,
      :target_language_picture_file_path,
      :target_language_notes
    ])
    |> validate_required([
      :target_language,
      :target_language_meaning,
      :source_language_meaning,
      :flashcard_type
    ])
  end
end
