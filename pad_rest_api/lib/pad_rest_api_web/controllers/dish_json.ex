defmodule PadRestApiWeb.DishJSON do
  alias PadRestApi.Dishes.Dish

  @doc """
  Renders a list of dishes.
  """
  def index(%{dishes: dishes}) do
    %{data: for(dish <- dishes, do: data(dish))}
  end

  @doc """
  Renders a single dish.
  """
  def show(%{dish: dish}) do
    %{data: data(dish)}
  end

  defp data(%Dish{} = dish) do
    %{
      id: dish.id,
      name: dish.name
    }
  end
end
