defmodule PadRestApi.DefaultController do
  use PadRestApiWeb, :controller

  def index(conn, _params) do
    text conn, "Pick A Dish API! - #{Mix.env()}"
  end
end
