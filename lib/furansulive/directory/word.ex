defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.Directory.FlashCard

  schema "words" do
    field :word, :string
    field :phonectic, :string
    field :context, :string
    field :definition, :string
    field :example, :string
    field :audio, :string

    field :part_of_speech, Ecto.Enum,
      values: [:noun, :pronoun, :adjective, :adverb, :preposition, :conjunction, :interjection]

    has_many :flashcards, FlashCard
    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [
      :word,
      :phonectic,
      :context,
      :definition,
      :example,
      :audio
    ])
    |> validate_required([
      :word,
      :phonectic,
      :context,
      :definition,
      :example
    ])
  end
end
