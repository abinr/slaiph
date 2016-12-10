defmodule Slaiph.Cell do

  def start_link(n) do
    Agent.start_link fn -> n end
  end

  def cell_alive?(coords) do
    Agent.get(&(&1)) == 1
  end

  def live(coords) do
    change_state coords, 1
  end

  def die(coords) do
    change_state coords, 0
  end

  defp change_state(coords, state) do
    Agent.update coords, fn _ -> state end
  end
      
end
