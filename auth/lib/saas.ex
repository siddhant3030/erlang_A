# defmodule HealthyEats.Zone.CountryZoneMember do
#   use HealthyEats.Schema
#   import Ecto.Changeset
#   alias HealthyEats.Zone
#   alias HealthyEats.Region.Country

#   schema "country_members" do
#     belongs_to(:zone, Zone)
#     belongs_to(:country, Country)

#     timestamps()
#   end

#   def create_changeset(country_zone_member, params \\ %{}) do
#     country_zone_member
#     |> cast(params, [:zone_id, :country_id])
#     |> validate_required(:zone_id, :country_id)
#     # |> foreign_key_constraint(:zone_id)
#     # |> unique_constraint(:country_id, name: :unique_zone_and_country)
#     # |> foreign_key_constraint(:country_id)
#     # |> check_constraint(
#     #   :zone_id,
#     #   name: :unique_zone_and_country,
#     #   message: "this does not refer to a country zone"
#     # )
#   end

#   def update_changeset(state_zone_member, params) do
#     state_zone_member
#     |> cast(params, [:state_id])
#     |> foreign_key_constraint(:state_id)
#     |> unique_constraint(:state_id, name: :unique_zone_and_country)
#   end
# end
