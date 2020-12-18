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

# iex(1)> Enum.at(10..20, 3)
# 13
# iex(2)> Enum.take(list, 2)
# ** (CompileError) iex:2: undefined function list/0
#     (stdlib 3.13.2) lists.erl:1358: :lists.mapfoldl/3
# iex(2)> list = Enum.to_list 1..5
# [1, 2, 3, 4, 5]
# iex(3)> Enum.take(list, 2)
# [1, 2]
# iex(4)>

# ist = Enum.to_list 1..5
# [1, 2, 3, 4, 5]
# iex(3)> Enum.take(list, 2)
# [1, 2]
# iex(4)> import Enum
# Enum
# iex(5)> deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
# ['C2', 'D2', 'H2', 'S2', 'C3', 'D3', 'H3', 'S3', 'C4', 'D4', 'H4', 'S4', 'C5',
#  'D5', 'H5', 'S5', 'C6', 'D6', 'H6', 'S6', 'C7', 'D7', 'H7', 'S7', 'C8', 'D8',
#  'H8', 'S8', 'C9', 'D9', 'H9', 'S9', 'CT', 'DT', 'HT', 'ST', 'CJ', 'DJ', 'HJ',
#  'SJ', 'CQ', 'DQ', 'HQ', 'SQ', 'CK', 'DK', 'HK', 'SK', 'CA', 'DA', ...]
