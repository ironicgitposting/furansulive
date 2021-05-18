defmodule FuransuliveWeb.FlashCardController do
  use FuransuliveWeb, :controller

  alias Furansulive.SpacedRepetition
  alias Furansulive.SpacedRepetition.FlashCard

  action_fallback FuransuliveWeb.FallbackController

  def index(conn, _params) do
    flashcards = SpacedRepetition.list_flashcards()
    render(conn, "index.json", flashcards: flashcards)
  end

  def create(conn, %{"flash_card" => flash_card_params}) do
    with {:ok, %FlashCard{} = flash_card} <- SpacedRepetition.create_flash_card(flash_card_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.flash_card_path(conn, :show, flash_card))
      |> render("show.json", flash_card: flash_card)
    end
  end

  def show(conn, %{"id" => id}) do
    flash_card = SpacedRepetition.get_flash_card!(id)
    render(conn, "show.json", flash_card: flash_card)
  end

  def update(conn, %{"id" => id, "flash_card" => flash_card_params}) do
    flash_card = SpacedRepetition.get_flash_card!(id)

    with {:ok, %FlashCard{} = flash_card} <-
           SpacedRepetition.update_flash_card(flash_card, flash_card_params) do
      render(conn, "show.json", flash_card: flash_card)
    end
  end

  def delete(conn, %{"id" => id}) do
    flash_card = SpacedRepetition.get_flash_card!(id)

    with {:ok, %FlashCard{}} <- SpacedRepetition.delete_flash_card(flash_card) do
      send_resp(conn, :no_content, "")
    end
  end
end
