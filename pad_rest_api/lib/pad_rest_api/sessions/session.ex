defmodule PadRestApi.Sessions.Session do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "sessions" do
    field :sessionID, :string
    field :creatorID, :binary_id

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:sessionID])
    |> validate_required([:sessionID])
  end
end
