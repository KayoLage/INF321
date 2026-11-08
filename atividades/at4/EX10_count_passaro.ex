defmodule BirdCount do

  @busy_day_num 5 # define quantos passaros devem ter visitado para aquele dia ser um dia ocupady (busy day)
  def today(list) do
    if length(list) == 0 do
      :nil # retorna atomo :nil
    else
      hd(list) # retorna a cabeca da lista encadeada
    end
  end

  #def increment_day_count(list) do
  #  [hd(list) + 1 | tl(list)]
  #end
  
  # Por pattern matching fica mais idiomatico que a forma acima
  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  # Nao podemos esquecer de tratar o caso da lista vazia!
  # o exercicio pede para criar uma cabeca com valor 1
  def increment_day_count([]), do: [1]

  def search_empty_val([]), do: false
  
  def search_empty_val([head | tail]) when head == 0, do: true
  
  def search_empty_val([head | tail]) do
    search_empty_val(tail)
  end
  
  def has_day_without_birds?(list) do
    search_empty_val(list)
  end

  def sum_all_items([], sum), do: sum

  def sum_all_items([head | tail], sum) do
    sum_all_items(tail, sum + head)
  end
  
  def total(list) do
    sum_all_items(list, 0)
  end

  def search_busy_days([], count_busy_days), do: count_busy_days

  def search_busy_days([head | tail], count_busy_days) do
    # o if nao altera a variavel count_busy_days, altera so naquela chamada de funcao localmente
    # assim que o if termina aquela variavel é descartada, entao nao poderiamos fazer um add no count
    # e logo usa-la na funcao recursiva senao ela ia receber o mesmo valor pra sempre (0)
    if head >= @busy_day_num do
      new_count = count_busy_days + 1
      search_busy_days(tail, new_count)
    else
      search_busy_days(tail, count_busy_days)
    end
    
  end
    
  def busy_days(list) do
    search_busy_days(list, 0)
  end
end
