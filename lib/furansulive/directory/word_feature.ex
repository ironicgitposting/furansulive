defmodule Furansulive.Directory.WordFeature do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.Directory.Word

  @required [:feature, :abbreviation]

  schema "word_features" do
    field :feature, :string
    field :abbreviation, :string
    belongs_to(:word, Word)
  end

  def changeset(feature, attrs) do
    feature
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
