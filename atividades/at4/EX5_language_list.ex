defmodule LanguageList do
  def new() do
    [] 
  end

  def add(list, language) do
    # Please implement the add/2 function
    # concat op -> "++"
    # list ++ [language] -> nao funciona exercicio pede para inserir no inicio (head) da lista
    # Usando notação [head | tail]
    [language | list]
  end

  def remove(list) do
    # Please implement the remove/1 function
    #list.delete_at(list, 0) # o método delete_at() apaga por índice
                             # o método delete() apaga por valor
                             # Porém ambos são O(n)!
                             
    # Podemos retornar apenas a cauda (tail) da lista encadeada
    tl(list) # list = [0, 1, 2] => tl(list) = [1, 2]                 
  end

  def first(list) do
    # Please implement the first/1 function
    hd(list)
  end

  def count(list) do
    # Please implement the count/1 function
    length(list)
  end

  def functional_list?(list) do
    # Please implement the functional_list?/1 function
    # é pra checar se na lista tem APENAS strings que se remetam à linguages funcionais como "Elixir", "Haskell", nao serao admitidos "Java", "C"
    functional_list = ["Clojure", "Elixir", "Erlang", "Haskell", "Kotlin", "Scala", "F#", "OCaml", "Lisp"] # string são determinadas por aspas duplas, aspas simples são charlists
    # charlist => 'Elixir'
                  # [69, 108, 105, 120, 105, 114] -> cria uma lista dos valores UNICODE de cada caractere
    Enum.all?(list, fn language -> language in functional_list end) # Sintaxe: Enum.all?(lista, funcao)
  end
end
