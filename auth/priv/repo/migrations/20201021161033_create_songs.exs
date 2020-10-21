defmodule Auth.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :title, :string
      add :url, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
