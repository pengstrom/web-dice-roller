defmodule WebDiceRollerWeb.RollController do
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

    render conn, "roll.html", rolls: rolls, roll_sum: roll_sum
  end
end

