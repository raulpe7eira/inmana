defmodule Inmana.Welcome do
  # Receber um nome e uma idade do usuário
  # Se o usuário chamar "banana" e tiver idade "42", ele recebe uma mensagem especial
  # Se o usuário for maior de idade, ele recebe uma mensagem normal
  # Se o usuário for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuário para entradas erradas, como "BaNaNa", "BaNaNa  \n"
  def call(%{"name" => name, "age" => age}) do
    evaluate(
      get_name(name),
      get_age(age)
    )
  end

  defp get_name(name), do: name |> String.trim() |> String.downcase()

  defp get_age(age), do: String.to_integer(age)

  defp evaluate("banana", 42), do: {:ok, "You are very special banana"}

  defp evaluate(name, age) when age >= 18, do: {:ok, "Welcome #{name}"}

  defp evaluate(name, _age), do: {:error, "You shall not pass #{name}"}
end
