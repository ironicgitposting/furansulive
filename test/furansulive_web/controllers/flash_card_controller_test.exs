defmodule FuransuliveWeb.FlashCardControllerTest do
  use FuransuliveWeb.ConnCase

  alias Furansulive.SpacedRepetition
  alias Furansulive.SpacedRepetition.FlashCard

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:flash_card) do
    {:ok, flash_card} = SpacedRepetition.create_flash_card(@create_attrs)
    flash_card
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all flashcards", %{conn: conn} do
      conn = get(conn, Routes.flash_card_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create flash_card" do
    test "renders flash_card when data is valid", %{conn: conn} do
      conn = post(conn, Routes.flash_card_path(conn, :create), flash_card: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.flash_card_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.flash_card_path(conn, :create), flash_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update flash_card" do
    setup [:create_flash_card]

    test "renders flash_card when data is valid", %{conn: conn, flash_card: %FlashCard{id: id} = flash_card} do
      conn = put(conn, Routes.flash_card_path(conn, :update, flash_card), flash_card: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.flash_card_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, flash_card: flash_card} do
      conn = put(conn, Routes.flash_card_path(conn, :update, flash_card), flash_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete flash_card" do
    setup [:create_flash_card]

    test "deletes chosen flash_card", %{conn: conn, flash_card: flash_card} do
      conn = delete(conn, Routes.flash_card_path(conn, :delete, flash_card))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.flash_card_path(conn, :show, flash_card))
      end
    end
  end

  defp create_flash_card(_) do
    flash_card = fixture(:flash_card)
    %{flash_card: flash_card}
  end
end
