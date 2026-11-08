defmodule GuessingGame do

  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  
  # deve vir primeiro que greater than e less than (senao nunca seria chamado => Elixir analisa top-down)
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"

  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  
  # O "Make a guess" deve vir primeiro que o greater than
  # Átomo é considerado maior que qualquer número, pegaria o "Too high" e nunca chegaria no "Make a guess"
  # Aridade 1: quando nenhum palpite é passado (ex: compare(15)), é passado para funcao de baixo
  def compare(secret_number, guess \\ :no_guess)

  def compare(_secret_number, :no_guess), do: "Make a guess"
  
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
 
end
