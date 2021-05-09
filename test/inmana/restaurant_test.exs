defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Estufa costela", email: "costela@mail.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 email: "costela@mail.com",
                 name: "Estufa costela"
               },
               valid?: true
             } = result
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "A", email: ""}
      expected_result = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result
      assert errors_on(result) == expected_result
    end
  end
end
