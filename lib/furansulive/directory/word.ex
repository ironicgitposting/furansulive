defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.SpacedRepetition.FlashCard

  schema "words" do
    field :unit, :string

    field :type, Ecto.Enum,
      values: [:noun, :pronoun, :adjective, :adverb, :preposition, :conjunction, :interjection]

    has_many :flashcards, FlashCard
    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:unit, :type, :meaning])
    |> validate_required([:unit, :type])
  end
end
