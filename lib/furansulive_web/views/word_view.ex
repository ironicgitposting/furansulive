defmodule FuransuliveWeb.WordView do
  use FuransuliveWeb, :view
  alias FuransuliveWeb.WordView

  def render("index.json", %{words: words}) do
    %{data: render_many(words, WordView, "word.json")}
  end

  def render("show.json", %{word: word}) do
    %{data: render_one(word, WordView, "word.json")}
  end

  def render("word.json", %{word: word}) do
    %{id: word.id,
      name: word.name,
      description: word.description,
      tag: word.tag}
  end
end
