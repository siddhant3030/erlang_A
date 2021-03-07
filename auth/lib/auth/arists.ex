defmodule HealthyEats.Artists do
  import Ecto.Query, warn: false
  alias Auth.Repo

  alias Auth.Playlists.Song


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
    |> Song.changeset(attrs)
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
  def update_artist(%Artist{} = song, attrs) do
    song
    |> Song.changeset(attrs)
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
  def delete_artist(%Artist{} = song) do
    Repo.delete(song)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking song changes.

  ## Examples

      iex> change_song(song)
      %Ecto.Changeset{data: %Song{}}

  """
  def change_aritst(%Aritst{} = artist, attrs \\ %{}) do
    Artist.changeset(song, attrs)
  end
end
