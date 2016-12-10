defmodule Slaiph.Router do
  use Slaiph.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Slaiph do
    pipe_through :api
  end
end
