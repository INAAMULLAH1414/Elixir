defmodule AssocApiWeb.AvatarController do
  use AssocApiWeb, :controller
  alias AssocApi.{Avatars, Users}

  def index(conn, %{"user_id" => id}) do
    avatars = Avatars.all_avatars(id)
    render(conn, "index.json", avatars: avatars)
  end

  def create(conn, %{"user_id" => id} = params)do
    IO.inspect("hello")
    IO.inspect(params)
    user = Users.get_user_by_id(id)
    IO.inspect(user)
    cond do
      user.avatar == nil ->
        {:ok, avatar} = Avatars.create_avatar(params)
        IO.inspect(avatar)
        render(conn, "create.json")

      user.avatar != nil -> render(conn, "create_error.json")
    end
  end

  def show(conn, %{"id" => id})do
    avatar = Avatars.get_avatar(id)
    render(conn, "show.json", avatar: avatar)
  end

  def delete(conn, %{"id" => id})do
    avatar = Avatars.delete_avatar(id)
    case avatar do
      {:ok, _avatar} -> render(conn, "delete.json")
    end
  end

  def update(conn, %{"id" => id} = params)do
    avatar = Avatars.get_avatar(id)
    avatar = Avatars.update_avatar(avatar, params)

    case avatar do
      {:ok, _avatar} -> render(conn, "update.json")
    end
  end

end
