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
  # }
end


# artist = Repo.get_by(Artist, name: "ritviz")
# [debug] QUERY OK source="artists" db=3.0ms idle=1134.0ms
# SELECT a0."id", a0."name", a0."inserted_at", a0."updated_at" FROM "artists" AS a0 WHERE (a0."name" = $1) ["ritviz"]
# %Auth.MusicDb.Artist{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "artists">,
#   albums: #Ecto.Association.NotLoaded<association :albums is not loaded>,
#   id: 4,
#   inserted_at: ~N[2020-11-28 18:58:41],
#   name: "ritviz",
#   updated_at: ~N[2020-11-28 18:58:41]
# }
# iex(35)> album = Ecto.build_assoc(artist, :albums, title: "udd gaye")
# %Auth.MusicDb.Album{
#   __meta__: #Ecto.Schema.Metadata<:built, "albums">,
#   artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#   artist_id: 4,
#   genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#   id: nil,
#   inserted_at: nil,
#   name: nil,
#   title: "udd gaye",
#   tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#   updated_at: nil
# }
# iex(36)> Repo.insert(album)
# [debug] QUERY OK db=4.1ms queue=1.9ms idle=1334.0ms
# INSERT INTO "albums" ("artist_id","title","inserted_at","updated_at") VALUES ($1,$2,$3,$4) RETURNING "id" [4, "udd gaye", ~N[2020-11-28 19:01:19], ~N[2020-11-28 19:01:19]]
# {:ok,
#  %Auth.MusicDb.Album{
#    __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#    artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#    artist_id: 4,
#    genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#    id: 8,
#    inserted_at: ~N[2020-11-28 19:01:19],
#    name: nil,
#    title: "udd gaye",
#    tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#    updated_at: ~N[2020-11-28 19:01:19]
#  }}



# iex(41)> artist = Repo.one(from a in Artist, where: a.name == "ritviz", preload: :albums)
# [debug] QUERY OK source="artists" db=2.2ms queue=3.0ms idle=1740.2ms
# SELECT a0."id", a0."name", a0."inserted_at", a0."updated_at" FROM "artists" AS a0 WHERE (a0."name" = 'ritviz') []
# [debug] QUERY OK source="albums" db=5.2ms idle=1745.6ms
# SELECT a0."id", a0."title", a0."name", a0."inserted_at", a0."updated_at", a0."artist_id", a0."artist_id" FROM "albums" AS a0 WHERE (a0."artist_id" = $1) ORDER BY a0."artist_id" [4]
# %Auth.MusicDb.Artist{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "artists">,
#   albums: [
#     %Auth.MusicDb.Album{
#       __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#       artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#       artist_id: 4,
#       genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#       id: 8,
#       inserted_at: ~N[2020-11-28 19:01:19],
#       name: nil,
#       title: "udd gaye",
#       tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#       updated_at: ~N[2020-11-28 19:01:19]
#     },
#     %Auth.MusicDb.Album{
#       __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#       artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#       artist_id: 4,
#       genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#       id: 9,
#       inserted_at: ~N[2020-11-28 19:02:54],
#       name: nil,
#       title: "hawa",
#       tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#       updated_at: ~N[2020-11-28 19:02:54]
#     }
#   ],
#   id: 4,
#   inserted_at: ~N[2020-11-28 18:58:41],
#   name: "ritviz",
#   updated_at: ~N[2020-11-28 18:58:41]
# }



# iex(45)> changeset = Repo.get_by(Artist, name: "ritviz")|> Repo.preload(:albums) |> change |> put_assoc(:albums, [%Album{title: "raahi"} | artist.albums])
# [debug] QUERY OK source="artists" db=3.1ms idle=1292.0ms
# SELECT a0."id", a0."name", a0."inserted_at", a0."updated_at" FROM "artists" AS a0 WHERE (a0."name" = $1) ["ritviz"]
# [debug] QUERY OK source="albums" db=2.1ms idle=1295.4ms
# SELECT a0."id", a0."title", a0."name", a0."inserted_at", a0."updated_at", a0."artist_id", a0."artist_id" FROM "albums" AS a0 WHERE (a0."artist_id" = $1) ORDER BY a0."artist_id" [4]
# #Ecto.Changeset<
#   action: nil,
#   changes: %{
#     albums: [
#       #Ecto.Changeset<action: :insert, changes: %{}, errors: [],
#        data: #Auth.MusicDb.Album<>, valid?: true>,
#       #Ecto.Changeset<action: :update, changes: %{}, errors: [],
#        data: #Auth.MusicDb.Album<>, valid?: true>,
#       #Ecto.Changeset<action: :update, changes: %{}, errors: [],
#        data: #Auth.MusicDb.Album<>, valid?: true>
#     ]
#   },
#   errors: [],
#   data: #Auth.MusicDb.Artist<>,
#   valid?: true
# >
# iex(46)> Repo.update(changeset)
# [debug] QUERY OK db=2.3ms idle=1534.6ms
# begin []
# [debug] QUERY OK db=2.2ms
# INSERT INTO "albums" ("artist_id","title","inserted_at","updated_at") VALUES ($1,$2,$3,$4) RETURNING "id" [4, "raahi", ~N[2020-11-28 19:43:54], ~N[2020-11-28 19:43:54]]
# [debug] QUERY OK db=3.1ms
# commit []
# {:ok,
#  %Auth.MusicDb.Artist{
#    __meta__: #Ecto.Schema.Metadata<:loaded, "artists">,
#    albums: [
#      %Auth.MusicDb.Album{
#        __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#        artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#        artist_id: 4,
#        genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#        id: 10,
#        inserted_at: ~N[2020-11-28 19:43:54],
#        name: nil,
#        title: "raahi",
#        tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#        updated_at: ~N[2020-11-28 19:43:54]
#      },
#      %Auth.MusicDb.Album{
#        __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#        artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#        artist_id: 4,
#        genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#        id: 8,
#        inserted_at: ~N[2020-11-28 19:01:19],
#        name: nil,
#        title: "udd gaye",
#        tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#        updated_at: ~N[2020-11-28 19:01:19]
#      },
#      %Auth.MusicDb.Album{
#        __meta__: #Ecto.Schema.Metadata<:loaded, "albums">,
#        artist: #Ecto.Association.NotLoaded<association :artist is not loaded>,
#        artist_id: 4,
#        genres: #Ecto.Association.NotLoaded<association :genres is not loaded>,
#        id: 9,
#        inserted_at: ~N[2020-11-28 19:02:54],
#        name: nil,
#        title: "hawa",
#        tracks: #Ecto.Association.NotLoaded<association :tracks is not loaded>,
#        updated_at: ~N[2020-11-28 19:02:54]
#      }
#    ],
#    id: 4,
#    inserted_at: ~N[2020-11-28 18:58:41],
#    name: "ritviz",
#    updated_at: ~N[2020-11-28 18:58:41]
#  }}
# iex(47)>
