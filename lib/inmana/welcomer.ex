defmodule Inmana.Welcomer do

  # Receber um nome e uma idade do usuário
  # Se o usuário chamar "banana" e tiver idade "42", ele recebe uma mensagem especial
  # Se o usuário for maior de idade, ele recebe uma mensagem normal
  # Se o usuário for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuário para entradas erradas, como "BaNaNa", "BaNaNa  \n"

  #--dado --->[Modulo.funcao]---dado_modificado-->[Modulo.funcao2]--->dado_modificado

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    #pipe operator
    #name = String.trim(name)
    #name = String.downcase(name)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
