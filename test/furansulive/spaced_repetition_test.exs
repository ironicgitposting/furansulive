defmodule Furansulive.SpacedRepetitionTest do
  use Furansulive.DataCase

  alias Furansulive.SpacedRepetition

  describe "flashcards" do
    alias Furansulive.SpacedRepetition.FlashCard

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def flash_card_fixture(attrs \\ %{}) do
      {:ok, flash_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SpacedRepetition.create_flash_card()

      flash_card
    end

    test "list_flashcards/0 returns all flashcards" do
      flash_card = flash_card_fixture()
      assert SpacedRepetition.list_flashcards() == [flash_card]
    end

    test "get_flash_card!/1 returns the flash_card with given id" do
      flash_card = flash_card_fixture()
      assert SpacedRepetition.get_flash_card!(flash_card.id) == flash_card
    end

    test "create_flash_card/1 with valid data creates a flash_card" do
      assert {:ok, %FlashCard{} = flash_card} = SpacedRepetition.create_flash_card(@valid_attrs)
      assert flash_card.name == "some name"
    end

    test "create_flash_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SpacedRepetition.create_flash_card(@invalid_attrs)
    end

    test "update_flash_card/2 with valid data updates the flash_card" do
      flash_card = flash_card_fixture()
      assert {:ok, %FlashCard{} = flash_card} = SpacedRepetition.update_flash_card(flash_card, @update_attrs)
      assert flash_card.name == "some updated name"
    end

    test "update_flash_card/2 with invalid data returns error changeset" do
      flash_card = flash_card_fixture()
      assert {:error, %Ecto.Changeset{}} = SpacedRepetition.update_flash_card(flash_card, @invalid_attrs)
      assert flash_card == SpacedRepetition.get_flash_card!(flash_card.id)
    end

    test "delete_flash_card/1 deletes the flash_card" do
      flash_card = flash_card_fixture()
      assert {:ok, %FlashCard{}} = SpacedRepetition.delete_flash_card(flash_card)
      assert_raise Ecto.NoResultsError, fn -> SpacedRepetition.get_flash_card!(flash_card.id) end
    end

    test "change_flash_card/1 returns a flash_card changeset" do
      flash_card = flash_card_fixture()
      assert %Ecto.Changeset{} = SpacedRepetition.change_flash_card(flash_card)
    end
  end
end
