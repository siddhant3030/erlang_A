defmodule Auth.MusicDb.Genre do
  use Ecto.Schema
  alias Auth.MusicDb.Album

  schema "genres" do
    field :name
    timestamps()

    many_to_many :albums, Album, join_through: "albums_genres"
  end
   # changeset = change(%Artist{name: "shivani"})

  # new_album = Ecto.build_assoc(artist, :albums)
  # %Auth.MusicDb.Album{
  #   __meta__: #Ecto.Schema.Metadata<:built, "albums">,
  #   artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
  #   artist_id: 1,
  #   genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
  #   id: nil,
  #   inserted_at: nil,
  #   name: nil,
  #   title: nil,
  #   tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
  #   updated_at: nil
  #
end
