defmodule PadRestApiWeb.Router do
  use PadRestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PadRestApi do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
