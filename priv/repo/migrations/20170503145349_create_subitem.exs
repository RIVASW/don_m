defmodule DonM.Repo.Migrations.CreateSubitem do
  use Ecto.Migration

  def change do
    create table(:subitems) do
      add :name, :string
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end
    create index(:subitems, [:item_id])

  end
end
