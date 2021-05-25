defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.Directory.FlashCard
  alias Furansulive.Directory.WordFeature

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
        :adjective,
        :adverb,
        :conjunction,
        :determiner,
        :interjection,
        :noun,
        :preposition,
        :pronoun,
        :verb
      ]

    field :feature, Ecto.Enum,
      values: [
        :feminine,
        :invariable,
        :masculine,
        :plural,
        :no_distinct_feminine,
        :no_distinct_plural
      ]

    has_many :word_features, WordFeature
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
