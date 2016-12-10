defmodule Slaiph.CellTest do

  use ExUnit.Case, async: true

  test "lives" do
    {:ok, cell} = Slaiph.Cell.start_link 0
    assert Slaiph.Cell.cell_alive?(cell) == false
    Slaiph.Cell.live cell
    assert Slaiph.Cell.cell_alive?(cell) == true 
  end
end
