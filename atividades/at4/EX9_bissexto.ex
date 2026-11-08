defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    # OBS.: Elixir nao tem Else If, faremos com diretiva "cond"
    cond do
      # se for divisivel por 400 é divisivel por 4 => 400 = 4 x 100
      # entao se for divisivel por 400 é, automaticamente, bissexto (leap)
      rem(year, 400) == 0 ->
        true

      # senao é divisivel por 400, e é por 100 nao é bissexto
      rem(year, 100) == 0 ->
        false

      # senao é divisivel por 100, e é por 4 ok (400 nao se torna necessario daí)
      rem(year, 4) == 0 ->
        true

      # em qualquer outro caso: nao é bissexto
      true ->
        false
    end
  end
end