defmodule FuransuliveWeb.WordController do
  use FuransuliveWeb, :controller

  alias Furansulive.Directory
  alias Furansulive.Directory.Word

  action_fallback FuransuliveWeb.FallbackController

  def index(conn, _params) do
    words = Directory.list_words()
    IO.inspect(words)
    render(conn, "index.json", words: words)
  end

  def create(conn, %{"word" => word_params}) do
    with {:ok, %Word{} = word} <- Directory.create_word(word_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.word_path(conn, :show, word))
      |> render("show.json", word: word)
    end
  end

  def show(conn, %{"id" => id}) do
    word = Directory.get_word!(id)
    render(conn, "show.json", word: word)
  end

  def update(conn, %{"id" => id, "word" => word_params}) do
    word = Directory.get_word!(id)

    with {:ok, %Word{} = word} <- Directory.update_word(word, word_params) do
      render(conn, "show.json", word: word)
    end
  end

  def delete(conn, %{"id" => id}) do
    word = Directory.get_word!(id)

    with {:ok, %Word{}} <- Directory.delete_word(word) do
      send_resp(conn, :no_content, "")
    end
  end
end
