defmodule Furansulive.SpacedRepetition do
  @moduledoc """
  The SpacedRepetition context.
  """

  import Ecto.Query, warn: false
  alias Furansulive.Repo

  alias Furansulive.SpacedRepetition.FlashCard

  @doc """
  Returns the list of flashcards.

  ## Examples

      iex> list_flashcards()
      [%FlashCard{}, ...]

  """
  def list_flashcards do
    Repo.all(FlashCard)
  end

  @doc """
  Gets a single flash_card.

  Raises `Ecto.NoResultsError` if the Flash card does not exist.

  ## Examples

      iex> get_flash_card!(123)
      %FlashCard{}

      iex> get_flash_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_flash_card!(id), do: Repo.get!(FlashCard, id)

  @doc """
  Creates a flash_card.

  ## Examples

      iex> create_flash_card(%{field: value})
      {:ok, %FlashCard{}}

      iex> create_flash_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_flash_card(attrs \\ %{}) do
    %FlashCard{}
    |> FlashCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a flash_card.

  ## Examples

      iex> update_flash_card(flash_card, %{field: new_value})
      {:ok, %FlashCard{}}

      iex> update_flash_card(flash_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_flash_card(%FlashCard{} = flash_card, attrs) do
    flash_card
    |> FlashCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a flash_card.

  ## Examples

      iex> delete_flash_card(flash_card)
      {:ok, %FlashCard{}}

      iex> delete_flash_card(flash_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_flash_card(%FlashCard{} = flash_card) do
    Repo.delete(flash_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking flash_card changes.

  ## Examples

      iex> change_flash_card(flash_card)
      %Ecto.Changeset{data: %FlashCard{}}

  """
  def change_flash_card(%FlashCard{} = flash_card, attrs \\ %{}) do
    FlashCard.changeset(flash_card, attrs)
  end
end
