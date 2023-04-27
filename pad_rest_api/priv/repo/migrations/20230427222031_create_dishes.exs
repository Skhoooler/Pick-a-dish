defmodule PadRestApi.Repo.Migrations.CreateDishes do
  use Ecto.Migration

  def change do
    create table(:dishes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :userID, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:dishes, [:userID])
  end
end
