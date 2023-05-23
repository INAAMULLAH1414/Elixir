defmodule UsersWeb.PageController do
  use UsersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

 # def index(conn, _params) do
 #   text conn, "Hello I am API!"
 # end
end
