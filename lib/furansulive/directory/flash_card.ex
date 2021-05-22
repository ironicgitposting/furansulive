defmodule Furansulive.Directory.FlashCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias Furansulive.Directory.Word
  alias Furansulive.Accounts.User

  schema "flashcards" do
    # http://quivi.sourceforge.net/languagecodes.html
    field :target_language, Ecto.Enum,
      values: [
        :ja_JP,
        :en_US,
        :fr_FR
      ]

    field :target_language_phonetic, :string
    field :target_language_audio, :string
    field :target_language_definition, :string
    field :source_language_example, :string
    field :target_language_picture, :string
    field :target_language_notes, :string

    field :flashcard_type, Ecto.Enum,
      values: [
        :grammar,
        :vocabulary_audio,
        :vocabulary_sentence,
        :vocabulary_unit
      ]

    belongs_to(:word, Word)

    many_to_many(
      :users,
      User,
      join_through: "user_flashcard",
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(flash_card, attrs) do
    flash_card
    |> cast(attrs, [
      :target_language,
      :target_language_phonetic,
      :target_language_audio,
      :target_language_definition,
      :source_language_example,
      :target_language_picture,
      :target_language_notes,
      :flashcard_type
    ])
    |> validate_required([
      :target_language,
      :target_language_phonetic,
      :target_language_definition,
      :source_language_example,
      :target_language_picture,
      :target_language_notes,
      :flashcard_type
    ])
  end
end
