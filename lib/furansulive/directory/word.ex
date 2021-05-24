defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.Directory.FlashCard

  schema "words" do
    field :word, :string
    field :phonetic, :string
    field :context, :string
    field :definition, :string
    field :example, :string
    field :audio, :string
    field :rank, :integer
    field :main_lexicon, :string

    field :level, Ecto.Enum,
      values: [
        :basic,
        :beginner,
        :lower_intermediate,
        :intermediate,
        :advanced_intermediate,
        :advanced,
        :slang
      ]

    field :part_of_speech, Ecto.Enum,
      values: [
        :noun,
        :pronoun,
        :adjective,
        :adverb,
        :preposition,
        :conjunction,
        :interjection
      ]

    has_many :flashcards, FlashCard
    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [
      :word,
      :phonetic,
      :context,
      :definition,
      :example,
      :audio,
      :rank,
      :main_lexicon,
      :level
    ])
    |> validate_required([
      :word,
      :phonetic,
      :context,
      :definition,
      :example,
      :level
    ])
  end
end
