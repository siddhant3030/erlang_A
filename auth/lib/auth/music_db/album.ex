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
