defmodule KitchenCalculator do
  # definindo valores de um volume de cada respectiva medida em mililitros (mL)
  @us_cup_ml 240
  @us_fluid_ounce_ml 30
  @us_teaspoon_ml 5
  @us_tablespoon_ml 15

  def get_volume(volume_pair) do
    elem(volume_pair, 1) # retorna o segundo valor, referente ao numero de volumes
  end

  
  # ====== to_milliliter funcs ====== #
  def to_milliliter({:cup, volume}) do
    val_in_mL = volume * @us_cup_ml
    {:milliliter, val_in_mL}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    val_in_mL = volume * @us_fluid_ounce_ml
    {:milliliter, val_in_mL}  
  end

  def to_milliliter({:teaspoon, volume}) do
    val_in_mL = volume * @us_teaspoon_ml
    {:milliliter, val_in_mL}
  end

  def to_milliliter({:tablespoon, volume}) do
    val_in_mL = volume * @us_tablespoon_ml
    {:milliliter, val_in_mL}
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end
  # ================================ #


  # === from_milliliter() funcs === #
  def from_milliliter({:milliliter, volume}, :cup) do
    {:cup, volume / @us_cup_ml}
  end
  
  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / @us_fluid_ounce_ml}
  end
  
  def from_milliliter({:milliliter, volume}, :teaspoon) do
    {:teaspoon, volume / @us_teaspoon_ml}
  end
  
  def from_milliliter({:milliliter, volume}, :tablespoon) do
    {:tablespoon, volume / @us_tablespoon_ml}
  end
  
  def from_milliliter({:milliliter, volume}, :milliliter) do
    {:milliliter, volume}
  end
  # ================================ #

  def convert(volume_pair, unit) do 
    # quero converter elem(volume_pair, 0) -> unit
    # {:milliliters, 240} -> cup => {:cup, 1.0} 
    # ou
    # {:tablespoon, 2} -> {:teaspoon, 6}
    # ou seja:
    # to_milliliter({:tablespoon, 2}) = {:milliliter, 30}
    # from_milliliter({:milliliter, 30}, :teaspoon) = {:teaspoon, 30 / 5} = {:teaspoon, 6}
    volume_pair |> to_milliliter()
                |> from_milliliter(unit) 

    # essa forma acima de usar o pipe operator é equivalente a:
    # from_milliliter(to_milliliter(volume_pair), unit)
  end
end
