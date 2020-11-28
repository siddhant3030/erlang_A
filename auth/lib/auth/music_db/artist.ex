defmodule Auth.MusicDb.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :name, :string
    timestamps()

    has_many :albums, Auth.MusicDb.Album
  end


  def changeset(artist, params) do
    artist
    |> cast(params, [:name])
  end

  # changeset = change(%Artist{name: "shivani"})
end
