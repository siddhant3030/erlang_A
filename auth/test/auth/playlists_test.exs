defmodule Auth.PlaylistsTest do
  use Auth.DataCase

  alias Auth.Playlists

  describe "songs" do
    alias Auth.Playlists.Song

    @valid_attrs %{is_active: true, title: "some title", url: "some url"}
    @update_attrs %{is_active: false, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{is_active: nil, title: nil, url: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playlists.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Playlists.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Playlists.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Playlists.create_song(@valid_attrs)
      assert song.is_active == true
      assert song.title == "some title"
      assert song.url == "some url"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playlists.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, %Song{} = song} = Playlists.update_song(song, @update_attrs)
      assert song.is_active == false
      assert song.title == "some updated title"
      assert song.url == "some updated url"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Playlists.update_song(song, @invalid_attrs)
      assert song == Playlists.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Playlists.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Playlists.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Playlists.change_song(song)
    end
  end
end
