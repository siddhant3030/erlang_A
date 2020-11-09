defmodule Auth.Schema.ArtistEmbed do
  import Ecto.Changeset
  use Ecto.Schema

  embedded_schema do
    field(:name, :string)
  end
end
