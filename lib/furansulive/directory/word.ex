defmodule Furansulive.Directory.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :description, :string
    field :name, :string
    field :tag, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:name, :description, :tag])
    |> validate_required([:name, :description, :tag])
  end
end
