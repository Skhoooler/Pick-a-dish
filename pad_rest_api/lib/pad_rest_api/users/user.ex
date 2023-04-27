defmodule PadRestApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :firstName, :string
    field :hashedPass, :string
    field :lastName, :string
    field :middleName, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstName, :middleName, :lastName, :email, :hashedPass])
    |> validate_required([:firstName, :middleName, :lastName, :email, :hashedPass])
  end
end
