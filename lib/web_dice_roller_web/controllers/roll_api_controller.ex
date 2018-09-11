defmodule WebDiceRollerWeb.RollApiController do
  use WebDiceRollerWeb, :controller

  def roll(conn, %{"spec" => spec}) do
    rolls = spec
    |> Dice.Parser.parser
    |> Dice.roll

    roll_sum = rolls
    |> Enum.filter(fn {s, _} -> s == :ok end)
    |> Enum.map(fn {:ok, {res, _, _}} -> res end)
    |> Enum.concat
    |> Enum.sum

     json conn, %{"spec" => spec, "rolls" => rolls |> Enum.map(&encode/1), "roll_sum" => roll_sum}
  end

  defp encode({:ok, {rolls, dice, spec}}) do
    %{
      "success" => true,
      "rolls" => rolls,
      "dice" => encode(dice),
      "spec" => spec
    }
  end
  defp encode({:error, spec}) do
    %{
      "success" => false,
      "spec" => spec
    }
  end
  defp encode({:dice, s, n, m}) do
    %{
      "type" => "dice",
      "sides" => s,
      "rolls" => n,
      "multiplier" => m
    }
  end
  defp encode({:const, c}) do
    %{
      "type" => "const",
      "value" => c
    }
  end
end
