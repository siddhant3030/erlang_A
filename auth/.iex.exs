alias Auth.Repo
import Ecto.Query
alias Auth.MusicDb.{Artist, Album, Track, Genre}
alias Auth.Accounts.User
alias Auth.Accounts
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

# q = from t in "tracks", select: [t.album_id, t.title, t.index, t.duration], order_by: [t.album_id, t.index]

# group by example
# q = from t in "tracks", select: [t.album_id, sum(t.duration)], group_by: t.album_id
