defmodule HealthyEats.Zone.StateZoneMember do
  use HealthyEats.Schema
  import Ecto.Changeset
  alias HealthyEats.Zone
  alias HealthyEats.Region.State

  schema "state_members" do
    belongs_to(:zone, Zone)
    belongs_to(:state, State)

    timestamps()
  end

  def create_changeset(state_zone_member, params) do
    state_zone_member
    |> cast(params, [:zone_id, :state_id])
    |> validate_required(:zone_id, :state_id)
    |> foreign_key_constraint(:zone_id)
    |> unique_constraint(:state_id, name: :unique_zone_and_state)
    |> foreign_key_constraint(:state_id)
    |> check_constraint(
      :zone_id,
      name: :unique_zone_and_state,
      message: "this does not refer to a state zone"
    )
  end

  def update_changeset(state_zone_member, params) do
    state_zone_member
    |> cast(params, [:state_id])
    |> foreign_key_constraint(:state_id)
    |> unique_constraint(:state_id, name: :unique_zone_and_state)
  end
end
