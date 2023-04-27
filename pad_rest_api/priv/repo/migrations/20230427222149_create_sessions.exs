defmodule PadRestApi.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sessionID, :string
      add :creatorID, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:sessions, [:creatorID])
  end
end
