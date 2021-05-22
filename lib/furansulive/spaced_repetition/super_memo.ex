defmodule Furansulive.SpacedRepetition.SuperMemo do
  @moduledoc """
  Based on super memo formular (# https://www.supermemo.com/en/archives1990-2015/english/ol/sm2)
  1. Apply the memorizing optimization procedures to smallest possible items (flashcards)
  2. Differentiate between the items on the base of theur different difficulty

  # I(1):=1
  # I(2):=6
  # for n>2 I(n):=I(n-1)*EF

  Where:
  I(n) - inter-repetition interval after the n-th repetition (in days)

  EF - easiness factor reflecting the easiness of memorizing and retaining a given item
  in memory (later called the E-Factor).

  Formula general form:
    EF':=f(EF,q)

    Where:
    EF' - new value of the E-Factor
    EF - old value of the E-Factor
    q - quality of the response
    f - function used in calculating EF'.
  """
end
