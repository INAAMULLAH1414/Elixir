defmodule AssocApiWeb.PageController do
  use AssocApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
