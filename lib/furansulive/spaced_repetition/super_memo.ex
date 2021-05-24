defmodule Furansulive.SpacedRepetition.SuperMemo do
  @moduledoc """
  Based on super memo formula (# https://www.supermemo.com/en/archives1990-2015/english/ol/sm2)
  """

  alias Furansulive.Accounts
  alias Furansulive.Directory
  alias Furansulive.Directory.FlashCard

  # user_flashcard_query = from f in FlashCard, select: f.id

  # from u In User,
  # preload: [user_flashcards: ^user_flashcard_query]

  # Fetch from :users_flashcards

  # Case no result insert new line
  # Case Res update line
  # https://github.com/thyagoluciano/sm2/blob/master/lib/sm.dart

  # Least possible ease factor possible is 1.3
  defp get_ease_factor(previous_ease_factor, quality) do
    new_ease_factor =
      previous_ease_factor +
        (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))

    cond do
      new_ease_factor > 1.3 ->
        new_ease_factor

      true ->
        1.3
    end
  end

  # User got a wrong answer
  def compute_interval(quality, repetitions, previous_interval, previous_ease_factor)
      when is_integer(quality) and quality < 3 do
    {:ok, 0, 1, previous_ease_factor}
  end

  # User got a good answer
  # {:ok, interval, repetitions, ease_factor}
  # {:error, error}
  def compute_interval(quality, repetitions, previous_interval, previous_ease_factor)
      when is_integer(quality) and quality > 3 do
    case repetitions do
      0 ->
        {:ok, 1, repetitions + 1, get_ease_factor(previous_ease_factor, quality)}

      1 ->
        {:ok, 6, repetitions + 1, get_ease_factor(previous_ease_factor, quality)}

      _ ->
        interval =
          (previous_interval * previous_ease_factor)
          |> Decimal.from_float()
          |> Decimal.round(2)

        {:ok, interval, repetitions + 1, get_ease_factor(previous_ease_factor, quality)}
    end
  end
end
