defmodule FuransuliveWeb.FlashCardView do
  use FuransuliveWeb, :view
  alias FuransuliveWeb.FlashCardView

  def render("index.json", %{flashcards: flashcards}) do
    %{data: render_many(flashcards, FlashCardView, "flash_card.json")}
  end

  def render("show.json", %{flash_card: flash_card}) do
    %{data: render_one(flash_card, FlashCardView, "flash_card.json")}
  end

  def render("flash_card.json", %{flash_card: flash_card}) do
    %{id: flash_card.id,
      name: flash_card.name}
  end
end
