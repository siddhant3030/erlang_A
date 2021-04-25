defmodule Auth.MusicDb.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Auth.Repo
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

  def transaction_one() do
    cs =
      %Artist{name: nil}
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.validate_required([:name])

    Repo.transaction(fn ->
      case Repo.insert(cs) do
        {:ok, _artist} -> IO.puts("Artist insert succeeded")
        {:error, _value} -> IO.puts("Artist insert failed")
      end

      # case Repo.insert(Log.changeset_for_insert(cs)) do
      #   {:ok, _log} -> IO.puts("Log insert succeeded")
      #   {:error, _value} -> IO.puts("Log insert failed")
      # end
    end)
  end
end

# iex(9)> query = from t in "tracks", join: a in "albums", on: t.album_id == a.id, where: t.duration > 900, select: [t.id, t.title, a.title]
# #Ecto.Query<from t0 in "tracks", join: a1 in "albums", on: t0.album_id == a1.id,
#  where: t0.duration > 900, select: [t0.id, t0.title, a1.title]>
# iex(10)> Repo.all(query)
# [debug] QUERY OK source="tracks" db=11.1ms queue=4.3ms idle=998.9ms
# SELECT t0."id", t0."title", a1."title" FROM "tracks" AS t0 INNER JOIN "albums" AS a1 ON t0."album_id" = a1."id" WHERE (t0."duration" > 900) []
# [
#   [10, "No Blues", "Cookin' At The Plugged Nickel"],
#   [6, "If I Were A Bell", "Cookin' At The Plugged Nickel"]
# ]
# iex(11)>
