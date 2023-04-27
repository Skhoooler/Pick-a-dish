defmodule PadRestApi.Dishes.Dish do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "dishes" do
    field :name, :string
    field :userID, :binary_id

    timestamps()
  end

  @doc false
  def changeset(dish, attrs) do
    dish
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
