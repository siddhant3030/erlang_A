defmodule VideoChatWeb.SongController do
  use VideoChatWeb, :controller

  alias VideoChat.Playlists
  alias VideoChat.Playlists.Song

  def index(conn, _params) do
    songs = Playlists.list_songs()
    render(conn, "index.html", songs: songs)
  end

  def new(conn, _params) do
    changeset = Playlists.change_song(%Song{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"song" => song_params}) do
    case Playlists.create_song(song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song created successfully.")
        |> redirect(to: Routes.song_path(conn, :show, song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    song = Playlists.get_song!(id)
    render(conn, "show.html", song: song)
  end

  def edit(conn, %{"id" => id}) do
    song = Playlists.get_song!(id)
    changeset = Playlists.change_song(song)
    render(conn, "edit.html", song: song, changeset: changeset)
  end

  def update(conn, %{"id" => id, "song" => song_params}) do
    song = Playlists.get_song!(id)

    case Playlists.update_song(song, song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song updated successfully.")
        |> redirect(to: Routes.song_path(conn, :show, song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", song: song, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    song = Playlists.get_song!(id)
    {:ok, _song} = Playlists.delete_song(song)

    conn
    |> put_flash(:info, "Song deleted successfully.")
    |> redirect(to: Routes.song_path(conn, :index))
  end
end
