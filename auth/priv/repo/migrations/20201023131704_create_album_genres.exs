defmodule Auth.Repo.Migrations.CreateAlbumGenres do
  use Ecto.Migration

  def change do
    create table(:albums_genres) do
      add :album_id, references(:albums)
      add :genre_id, references(:genres)
    end
  end
end
