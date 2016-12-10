defmodule Slaiph.Channel do
  use Phoenix.Channel
  require Logger

  def join("life:game", _msg, socket) do
    send self, :after_join
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    loop(30, glider, socket)
    {:noreply, socket}
  end

  def loop(world_size, cells, socket) do
    cells = Slaiph.Game.evolve(cells)
    grid = format(world_size, cells)
    
    push socket, "board", %{"cells" => grid} 

    Process.sleep(1_000)
    loop(world_size, cells, socket)
  end

  def format(world_size, cells) do
    row_size = (div world_size, 2)
    for x <- 0..(row_size - 1), 
        y <- 0..(row_size - 1) 
    do {x, y} end
    |> Enum.map(&Enum.member?(cells, &1))
    |> Enum.chunk(row_size)
  end
     
  def blinker do
    [{1, 2}, {2,2}, {3,2}]
  end
  
  def glider do
    [{1, 0}, {2,1}, {0,2}, {1,2}, {2,2}]
  end
end
