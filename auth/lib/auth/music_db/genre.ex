defmodule Auth.MusicDb.Genre do
  use Ecto.Schema
  alias Auth.MusicDb.Album

  schema "genres" do
    field :name
    timestamps()

    many_to_many :albums, Album, join_through: "albums_genres"
  end
end
