defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.SpacedRepetition.FlashCard

  schema "words" do
    field :description, :string
    field :name, :string
    field :tag, :string
    has_many :flash_card, FlashCard
    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:name, :description, :tag])
    |> validate_required([:name, :description, :tag])
  end
end
