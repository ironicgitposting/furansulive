defmodule Furansulive.SpacedRepetition.FlashCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias Furansulive.Directory.Word

  schema "flashcards" do
    field :target_expression, :string
    field :target_expression_pronunciation, :string
    field :target_expression_sound_file_path, :string
    field :meaning, :string
    field :picture_file_path, :string
    field :notes, :string
    has_one :word, Word

    timestamps()
  end

  @doc false
  def changeset(flash_card, attrs) do
    flash_card
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
