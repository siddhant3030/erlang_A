defmodule BlogPhoenix.Repo.Migrations.AddUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :filename, :string
      add :size, :bigint
      add :content_type, :string
      add :hash, :string, size: 64
      add :has_thumb, :boolean, default: false

      timestamps()
    end
    create index(:uploads, [:hash])
  end
end
