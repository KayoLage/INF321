defmodule Lasagna do
  @lasgna_expected_time 40

  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    @lasgna_expected_time
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(remaining_min) do
    expected_minutes_in_oven() - remaining_min
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(num_layers) do
    2*num_layers
  end
  
  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(num_layers, num_mins_in_oven) do
    preparation_time_in_minutes(num_layers) + num_mins_in_oven
  end

  # Please define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end