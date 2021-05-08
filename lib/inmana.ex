defmodule Inmana do
  alias Inmana.Restaurants.Create, as: CreateRestaurant

  alias Inmana.Supplies.Create, as: CreateSupply
  alias Inmana.Supplies.Get, as: GetSupply

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call

  defdelegate create_supply(params), to: CreateSupply, as: :call
  defdelegate get_supply(id), to: GetSupply, as: :call
end
