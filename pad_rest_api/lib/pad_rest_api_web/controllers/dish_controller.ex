defmodule PadRestApiWeb.DishController do
  use PadRestApiWeb, :controller

  alias PadRestApi.Dishes
  alias PadRestApi.Dishes.Dish

  action_fallback PadRestApiWeb.FallbackController

  def index(conn, _params) do
    dishes = Dishes.list_dishes()
    render(conn, :index, dishes: dishes)
  end

  def create(conn, %{"dish" => dish_params}) do
    with {:ok, %Dish{} = dish} <- Dishes.create_dish(dish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/dishes/#{dish}")
      |> render(:show, dish: dish)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)
    render(conn, :show, dish: dish)
  end

  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{} = dish} <- Dishes.update_dish(dish, dish_params) do
      render(conn, :show, dish: dish)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{}} <- Dishes.delete_dish(dish) do
      send_resp(conn, :no_content, "")
    end
  end
end
