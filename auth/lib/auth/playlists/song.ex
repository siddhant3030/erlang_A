defmodule Auth.Playlists.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :is_active, :boolean, default: false
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title, :url, :is_active])
    |> validate_required([:title, :url, :is_active])
  end
end
