# defmodule HealthyEats.Repo.Migrations.CreateZoneAndZoneMemberAndCountryTable do
#   use Ecto.Migration

#   def change do
#     create table(:zone, primary_key: false) do
#       add :id, :uuid, primary_key: true
#       add :name, :string, null: :false
#       add :zone_type, :string, size: 1, null: false
#       add :description, :text, null: false
#       add(:is_default, :boolean, default: false)

#       timestamps()
#     end

#     create table(:state_members, primary_key: false) do
#       add :id, :uuid, primary_key: true

#       add :zone_id, references(:zone, on_delete: :delete_all, type: :uuid, column: :id),
#         null: false

#       add :state_id, references(:state, on_delete: :delete_all, type: :uuid, column: :id),
#         null: false

#       timestamps()
#     end

#     create table(:country_members, primary_key: false) do
#       add :id, :uuid, primary_key: true

#       add :zone_id, references(:zone, on_delete: :delete_all, type: :uuid, column: :id),
#         null: false

#       add :country_id, references(:country, on_delete: :delete_all, type: :uuid, column: :id),
#         null: false

#       timestamps()
#     end

#     create unique_index(:state_members, [:zone_id, :state_id], name: :unique_zone_and_state)
#     create unique_index(:country_members, [:zone_id, :country_id], name: :unique_zone_and_country)
#     create unique_index(:zone, [:is_default], where: "is_default=true", name: :unique_default_zone)
#   end
# end
