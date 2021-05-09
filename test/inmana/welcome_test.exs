defmodule Inmana.WelcomeTest do
  use ExUnit.Case

  alias Inmana.Welcome

  describe "call/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcome.call(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "raul", "age" => "41"}
      expected_result = {:ok, "Welcome raul"}

      result = Welcome.call(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "raul", "age" => "17"}
      expected_result = {:error, "You shall not pass raul"}

      result = Welcome.call(params)

      assert result == expected_result
    end
  end
end
