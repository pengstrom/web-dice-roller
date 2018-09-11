defmodule WebDiceRollerWeb.PageController do
  use WebDiceRollerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
