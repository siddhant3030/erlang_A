defmodule Auth.Schema.TrackEmbed do
  import Ecto.Changeset
  use Auth.Schema

  embedded_schema do
    field(:title, :string)
    field(:duration, :integer)
  end
end
