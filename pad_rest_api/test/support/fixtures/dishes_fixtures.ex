defmodule PadRestApi.DishesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PadRestApi.Dishes` context.
  """

  @doc """
  Generate a dish.
  """
  def dish_fixture(attrs \\ %{}) do
    {:ok, dish} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PadRestApi.Dishes.create_dish()

    dish
  end
end
