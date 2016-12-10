defmodule Slaiph.Game do

  def neighbours({x, y}) do
    for dx <- -1..1,
        dy <- -1..1,
        {dx, dy} != {0,0},
    do: { x + dx, y + dy } 
  end

  def evolve(grid) do
    for {new_cell, count} <- grid |> Enum.flat_map(&neighbours/1) |> frequencies,
        count == 3 || (count == 2 && Enum.member? grid, new_cell),
    do: new_cell
  end

  def frequencies(xs) do
    xs
    |> Enum.group_by(&(&1))
    |> Map.to_list
    |> Enum.map(fn {cell, instances} -> {cell, Enum.count instances} end)
  end
  
end
