defmodule FuransuliveWeb.WordControllerTest do
  use FuransuliveWeb.ConnCase

  alias Furansulive.Directory
  alias Furansulive.Directory.Word

  @create_attrs %{
    description: "some description",
    name: "some name",
    tag: "some tag"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    tag: "some updated tag"
  }
  @invalid_attrs %{description: nil, name: nil, tag: nil}

  def fixture(:word) do
    {:ok, word} = Directory.create_word(@create_attrs)
    word
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all words", %{conn: conn} do
      conn = get(conn, Routes.word_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create word" do
    test "renders word when data is valid", %{conn: conn} do
      conn = post(conn, Routes.word_path(conn, :create), word: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.word_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "tag" => "some tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.word_path(conn, :create), word: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update word" do
    setup [:create_word]

    test "renders word when data is valid", %{conn: conn, word: %Word{id: id} = word} do
      conn = put(conn, Routes.word_path(conn, :update, word), word: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.word_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "tag" => "some updated tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, word: word} do
      conn = put(conn, Routes.word_path(conn, :update, word), word: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete word" do
    setup [:create_word]

    test "deletes chosen word", %{conn: conn, word: word} do
      conn = delete(conn, Routes.word_path(conn, :delete, word))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.word_path(conn, :show, word))
      end
    end
  end

  defp create_word(_) do
    word = fixture(:word)
    %{word: word}
  end
end
