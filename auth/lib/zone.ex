# defmodule HealthyEats.Zone do
#   use HealthyEats.Schema
#   import Ecto.Changeset

#   @doc """
#   """
#   @valid_zone_types ["S", "C"]
#   @valid_zone_types
#   |> Enum.map(fn x -> "`#{x}`" end)
#   |> Enum.intersperse(", ")

#   schema "zone" do
#     field(:name, :string)
#     field(:description, :string)
#     field(:zone_type, :string)
#     field(:members, :any, virtual: true)
#     field(:is_default, :boolean, default: false)

#     timestamps()
#   end

#   def create_changeset(zone, params) do
#     zone
#     |> cast(params, [:name, :description, :is_default, :zone_type])
#     |> validate_required([:description, :is_default])
#     |> validate_inclusion(:zone_type, @valid_zone_types)
#   end

#   def update_changeset(zone, params) do
#     zone
#     |> cast(params, [:name, :description, :is_default, :zone_type])
#     |> validate_required([:description, :is_default])
#   end
# end
