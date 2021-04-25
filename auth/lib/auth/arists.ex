defmodule HealthyEats.Artists do
  import Ecto.Query, warn: false
  alias Auth.Repo

  alias Auth.MusicDb.Artist

  def main(_) do
    IO.puts("123")
  end

  @doc """
  Returns the list of songs.

  ## Examples

      iex> list_songs()
      [%Song{}, ...]

  """
  def list_artists do
    Repo.all(Artist)
  end

  @doc """
  Gets a single song.

  Raises `Ecto.NoResultsError` if the Song does not exist.

  ## Examples

      iex> get_song!(123)
      %Song{}

      iex> get_song!(456)
      ** (Ecto.NoResultsError)

  """
  def get_artist!(id), do: Repo.get!(Artist, id)

  @doc """
  Creates a song.

  ## Examples

      iex> create_song(%{field: value})
      {:ok, %Song{}}

      iex> create_song(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_artist(attrs \\ %{}) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a song.

  ## Examples

      iex> update_song(song, %{field: new_value})
      {:ok, %Song{}}

      iex> update_song(song, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_artist(%Artist{} = artist, attrs) do
    artist
    |> Artist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a song.

  ## Examples

      iex> delete_song(song)
      {:ok, %Song{}}

      iex> delete_song(song)
      {:error, %Ecto.Changeset{}}

  """
  def delete_artist(%Artist{} = artist) do
    Repo.delete(artist)
  end
end

# Example for idea
# q = from t in Track, join: a in Album, on: t.album_id == a.id, where: t.index == 1
# #Ecto.Query<from t0 in Auth.MusicDb.Track, join: a1 in Auth.MusicDb.Album,
#  on: t0.album_id == a1.id, where: t0.index == 1>
# iex(11)> Repo.all(q)
# [debug] QUERY OK source="tracks" db=1.6ms queue=1.4ms idle=1004.7ms
# SELECT t0."id", t0."title", t0."duration", t0."index", t0."number_of_plays", t0."inserted_at", t0."updated_at", t0."album_id" FROM "tracks" AS t0 INNER JOIN "albums" AS a1 ON t0."album_id" = a1."id" WHERE (t0."index" = 1) []
# [
#   %Auth.MusicDb.Track{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#     album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#     album_id: 1,
#     duration: 544,
#     id: 1,
#     index: 1,
#     inserted_at: ~N[2020-11-28 15:52:27],
#     number_of_plays: 0,
#     title: "So What",
#     updated_at: ~N[2020-11-28 15:52:27]
#   },
#   %Auth.MusicDb.Track{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#     album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#     album_id: 2,
#     duration: 1006,
#     id: 6,
#     index: 1,
#     inserted_at: ~N[2020-11-28 15:52:27],
#     number_of_plays: 0,
#     title: "If I Were A Bell",
#     updated_at: ~N[2020-11-28 15:52:27]
#   },
#   %Auth.MusicDb.Track{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#     album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#     album_id: 3,
#     duration: 192,
#     id: 11,
#     index: 1,
#     inserted_at: ~N[2020-11-28 15:52:27],
#     number_of_plays: 0,
#     title: "B Minor Waltz (for Ellaine)",
#     updated_at: ~N[2020-11-28 15:52:27]
#   },
#   %Auth.MusicDb.Track{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#     album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#     album_id: 4,
#     duration: 204,
#     id: 18,
#     index: 1,
#     inserted_at: ~N[2020-11-28 15:52:27],
#     number_of_plays: 0,
#     title: "Come Rain Or Come Shine",
#     updated_at: ~N[2020-11-28 15:52:27]
#   },
#   %Auth.MusicDb.Track{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "tracks">,
#     album: #Ecto.Association.NotLoaded<association :album is not loaded>,
#     album_id: 5,
#     duration: 761,
#     id: 27,
#     index: 1,
#     inserted_at: ~N[2020-11-28 15:52:28],
#     number_of_plays: 0,
#     title: "Anton's Ball",
#     updated_at: ~N[2020-11-28 15:52:28]
#   }
# ]
