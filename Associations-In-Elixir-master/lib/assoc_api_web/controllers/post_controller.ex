defmodule AssocApiWeb.PostController do
  use AssocApiWeb, :controller
  alias AssocApi.{Posts, Users, Post}

  def index(conn, %{"user_id" => user_id}) do
    posts = Posts.get_specific_posts(user_id)

    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"user_id" => user_id} =params)do
    user = Users.get_user_by_id(user_id)
    post = Posts.create_post(user, params)
    case post do
      {:ok, _user} -> render(conn, "create.json")

      {:error, msg} -> render(conn, "create_error.json", msg: msg)
    end
  end

  def show(conn,  %{"id" => id, "user_id" => user_id})do
    post = Posts.get_specific_post(user_id, id)
    IO.inspect(post)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "user_id" => user_id} = params)do
    Posts.get_specific_post(user_id, id)
    |> Posts.update_post(params)
    |> case  do
      {:ok, _post} -> render(conn, "update.json")

      {:error, _changeset} -> render(conn, "update_error.json")
     end
  end

  def delete(conn,  %{"id" => id, "user_id" => user_id})do
    post = Posts.get_specific_post(user_id, id)
    cond do
      post == nil ->
        render(conn, "delete_error.json")

      %Post{} = post ->
        Posts.delete_post(post)
        render(conn, "delete.json")
    end
  end

end
