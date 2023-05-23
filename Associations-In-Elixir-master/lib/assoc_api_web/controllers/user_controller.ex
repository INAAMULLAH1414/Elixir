defmodule AssocApiWeb.UserController do
  use AssocApiWeb, :controller
  alias AssocApi.Users

  def index(conn, _params) do
    users = Users.all_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    user = Users.create_user(params)
    case user do
      {:ok, _user} -> render(conn, "create.json")

      {:error, _changeset} -> render(conn, "error.json")
    end
  end

  def show(conn, %{"id" => id})do
    user = Users.get_user_by_id(id)
    render(conn, "show.json", user: user)
  end

  def delete(conn, %{"id" => id})do
    IO.inspect(id)
    user = Users.delete_user(id)
    IO.inspect(user)
    case user do
      {:ok, _user} -> render(conn, "delete.json")
    end
  end

  def update(conn, %{"id" => id} = params)do
    user = Users.get_user_by_id(id)
    user = Users.update_user(user, params)
    case user do
      {:ok, _user} -> render(conn, "update.json")
    end
  end
end
