defmodule Auth.MusicDb.Artist do
  use Ecto.Schema

  schema "artists" do
    field :name
    timestamps()

    has_many :albums, Auth.MusicDb.Album
  end
end
