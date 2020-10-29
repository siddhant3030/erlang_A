alias Auth.Repo
import Ecto.Query
alias Auth.MusicDb.{Artist, Album, Track, Genre}

# q = from "artists", where: [name: "Bill Evans"], select: [:id, :name]


# artist_id = "1"
# q = from "artists", where: [id: type(^artist_id, :integer)], select: [:name] Repo.all(q)
# #=> [%{name: "Miles Davis"}]


# # like statements
# q = from a in "artists", where: like(a.name, "Miles%"), select: [:id, :name] # checking for null
# q = from a in "artists", where: is_nil(a.name), select: [:id, :name] # checking for not null
# q = from a in "artists", where: not is_nil(a.name), select: [:id, :name]
# # date comparison - this finds artists added more than 1 year ago
# q = from a in "artists", where: a.inserted_at < ago(1, "year"), select: [:id, :name]
1
