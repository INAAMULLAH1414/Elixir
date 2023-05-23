defmodule AssocApiWeb.PostView do
  use AssocApiWeb, :view

  def render("create.json", _params)do
    %{data: "Post hass been created"}
  end

  def render("create_error.json", %{msg: msg})do
    %{data: msg}
  end

  def render("index.json", %{posts: posts})do
    %{data: render_many(posts, AssocApiWeb.PostView, "post.json")}
  end

  def render("show.json", %{post: post})do
    %{data: render_one(post, AssocApiWeb.PostView, "post.json")}
  end

  def render("update.json", _params)do
    %{data: "Post Updated Successfully"}
  end

  def render("update_error.json", _params)do
    %{data: "Wrong Pramateres!"}
  end

  def render("delete_error.json", _params)do
    %{data: "No Post Found Against this id!"}
  end

  def render("delete.json", _params)do
    %{data: "Post deleted!"}
  end

  def render("post.json", %{post: post})do
    %{
      header: post.header,
      body: post.body
    }
  end

end
