defmodule Furansulive.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Furansulive.Directory.FlashCard

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :admin, :boolean

    many_to_many(
      :flashcards,
      FlashCard,
      join_through: "user_flashcard",
      on_replace: :delete
    )

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_hashed_password()

    # To do Add assocs https://www.coletiv.com/blog/many-to-many-relationships-with-ecto/
  end

  def changeset_update_flashcards(user, flashcards) do
    user
    |> cast(%{}, [:email, :password])
    # associate flashcards to the user
    |> put_assoc(:flashcards, flashcards)
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          changeset,
          :encrypted_password,
          Map.fetch!(Pbkdf2.add_hash(password), :password_hash)
        )

      _ ->
        changeset
    end
  end
end
