alias Auth.Repo
import Ecto.Query
alias Auth.MusicDb.{Artist, Album, Track, Genre}

q = from "artists", where: [name: "Bill Evans"], select: [:id, :name]


artist_id = "1"
q = from "artists", where: [id: type(^artist_id, :integer)], select: [:name] Repo.all(q)
#=> [%{name: "Miles Davis"}]
