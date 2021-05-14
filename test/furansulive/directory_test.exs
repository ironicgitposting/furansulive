defmodule Furansulive.DirectoryTest do
  use Furansulive.DataCase

  alias Furansulive.Directory

  describe "words" do
    alias Furansulive.Directory.Word

    @valid_attrs %{description: "some description", name: "some name", tag: "some tag"}
    @update_attrs %{description: "some updated description", name: "some updated name", tag: "some updated tag"}
    @invalid_attrs %{description: nil, name: nil, tag: nil}

    def word_fixture(attrs \\ %{}) do
      {:ok, word} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_word()

      word
    end

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Directory.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Directory.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      assert {:ok, %Word{} = word} = Directory.create_word(@valid_attrs)
      assert word.description == "some description"
      assert word.name == "some name"
      assert word.tag == "some tag"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      assert {:ok, %Word{} = word} = Directory.update_word(word, @update_attrs)
      assert word.description == "some updated description"
      assert word.name == "some updated name"
      assert word.tag == "some updated tag"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_word(word, @invalid_attrs)
      assert word == Directory.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Directory.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Directory.change_word(word)
    end
  end
end
