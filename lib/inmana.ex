defmodule Inmana do
  alias Inmana.Restaurants.Create, as: CreateRestaurant

  alias Inmana.Supplies.Create, as: CreateSupply

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call

  defdelegate create_supply(params), to: CreateSupply, as: :call
end
