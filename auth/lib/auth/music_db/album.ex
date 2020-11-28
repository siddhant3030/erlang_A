defmodule Auth.MusicDb.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Auth.MusicDb.{Artist, Track, Genre}

  schema "albums" do
    field :title
    field :name, :map
    timestamps()

    belongs_to :artist, Artist
    has_many :tracks, Track
    many_to_many :genres, Genre, join_through: "albums_genres"
  end

  def changeset(album, params) do
    album
    |> cast(params, [:title, :name])
  end
end
