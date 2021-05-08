defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(id) do
    case Repo.get(Supply, id) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
