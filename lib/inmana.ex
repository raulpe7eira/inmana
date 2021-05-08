defmodule Inmana do
  alias Inmana.Restaurants.Create, as: CreateRestaurant

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call
end
