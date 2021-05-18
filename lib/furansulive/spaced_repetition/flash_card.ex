defmodule Furansulive.SpacedRepetition.FlashCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "flashcards" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(flash_card, attrs) do
    flash_card
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
