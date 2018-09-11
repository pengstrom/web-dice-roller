defmodule WebDiceRollerWeb.RollApiView do
  use WebDiceRollerWeb, :view

  def render("roll.json", %{spec: spec, rolls: rolls, roll_sum: roll_sum}) do
    %{spec: spec, rolls: rolls, roll_sum: roll_sum}
  end
end
