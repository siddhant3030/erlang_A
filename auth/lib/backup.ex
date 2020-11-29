# defmodule HealthyEats.Admin.Inventory.CartonAdmin do

#   alias HealthyEats.Repo
#   import Ecto.Query
#   alias HealthyEats.Account.Address
#   alias HealthyEats.Item.StockLocation
#   alias HealthyEats.Shipments.ShipmentMethod
#   alias Healthy.Item.OrderAdmin

#   def index(_) do
#     [
#       number: %{name: "Carton Number", value: fn x -> x.number end},
#       external_number: %{name: "External Number", value: fn x -> x.external_number end},
#       tracking: %{name: "Tracking", value: fn x -> x.tracking end},
#       shipped_at: %{name: "Shipped at", value: fn x -> x.shipped_at end},
#       address_id: %{name: "Address", value: fn x -> OrderAdmin.address(x.address_id) end},
#       stock_location_id: %{
#         name: "Stock Location",
#         value: fn x -> stock_location(x.stock_location_id) end
#       },
#       shipment_method_id: %{
#         name: "Shipment Method",
#         value: fn x -> shipment_method(x.shipment_method_id) end
#       }
#     ]
#   end

#   def form_fields(_) do
#     [
#       numnber: %{label: "Carton Number"},
#       external_number: %{label: "External Number"},
#       tracking: %{label: "Tracking"},
#       shipped_at: %{label: "Shipped at"},
#       address_id: %{
#         choices: Enum.map(OrderAdmin.address_list(), fn c -> {OrderAdmin.address(c.id), c.id} end)
#       },
#       stock_location_id: %{choices: Enum.map(list_stock_location(), fn s -> {s.name, s.id} end)},
#       shipment_method_id: %{choices: Enum.map(list_shipment_method(), fn s -> {s.name, s.id} end)}
#     ]
#   end

#   defp stock_location(stock_location_id) do
#     from(s in StockLocation, where: s.id == ^stock_location_id, select: s.name) |> Repo.one()
#   end

#   defp shipment_method(shipment_method_id) do
#     from(s in ShipmentMethod, where: s.id == ^shipment_method_id, select: s.name) |> Repo.one()
#   end

#   def list_shipment_method(), do: Repo.all(ShipmentMethod)
#   def list_stock_location(), do: Repo.all(StockLocation)
# end

# defmodule HealthyEats.Admin.Inventory.InventoryUnitAdmin do
#   @moduledoc """
#   Inventory Admin Module
#   """
#   import Ecto.Query
#   alias HealthyEats.Repo
#   alias HealthyEats.Item.Product.Variant
#   alias HealthyEats.Shipments.Shipment
#   alias HealthyEats.Item.OrderItem
#   alias HealthyEats.Inventories.Carton

#   def index(_) do
#     [
#       state: %{name: "State", value: fn x -> x.state end},
#       pending: %{name: "Pending", value: fn x -> x.pending end},
#       variant_id: %{name: "Variant", value: fn x -> variant(x) end},
#       shipment_id: %{name: "Shipment", value: fn x -> shipment(x) end},
#       carton_id: %{name: "Carton", value: fn x -> carton(x) end},
#       order_item_id: %{name: "Order Item", value: fn x -> order_item(x) end}
#     ]
#   end

#   def form_fields(_) do
#     [
#       state: %{label: "State"},
#       pending: %{label: "Pending"},
#       variant_id: %{choices: Enum.map(variant_list(), fn v -> {variant(v.id), v.id} end)},
#       shipment_id: %{choices: Enum.map(shipment_list(), fn s -> {shipment(s.id), s.id} end)},
#       carton_id: %{choices: Enum.map(carton_list(), fn c -> {carton(c.id), c.id} end)},
#       order_item_id: %{choices: Enum.map(order_item_list(), fn o -> {order_item(o.id), o.id} end)}
#     ]
#   end

#   def ordering(_schema) do
#     [desc: :inserted_at]
#   end

#   defp variant(variant_id) when not is_nil(variant_id) do
#     from(v in Variant, where: v.id == ^variant_id) |> Repo.one()
#   end

#   defp shipment(shipment_id) when not is_nil(shipment_id) do
#     from(s in Shipment, where: s.id == ^shipment_id) |> Repo.one()
#   end

#   defp carton(carton_id) when not is_nil(carton_id) do
#     from(s in Carton, where: s.id == ^carton_id) |> Repo.one()
#   end

#   def order_item(order_item_id) when not is_nil(order_item_id) do
#     from(o in OrderItem, where: o.id == ^order_item_id) |> Repo.one()
#   end

#   defp variant_list(), do: Repo.all(Variant)
#   defp shipment_list(), do: Repo.all(Shipment)
#   defp carton_list(), do: Repo.all(Carton)
#   defp order_item_list(), do: Repo.all(OrderItem)
# end
