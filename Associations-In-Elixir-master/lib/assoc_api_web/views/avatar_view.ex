defmodule AssocApiWeb.AvatarView do
  use AssocApiWeb, :view

  def render("index.json", %{avatars: avatars})do
    %{data: render_many(avatars, AssocApiWeb.AvatarView, "avatar.json")}
  end

  def render("create.json", _params) do

    %{data: "Avatar has been created successfully!"}
  end

  def render("create_error.json", _params) do

    %{data: "User Already Has Avatar"}
  end

  def render("show.json", %{avatar: avatar})do
    %{data: render_one(avatar, AssocApiWeb.AvatarView, "avatar.json")}
  end

  def render("delete.json", _params)do
    %{data: "Avatar Deleted!"}
  end

  def render("update.json", _params)do
    %{data: "Updated Successfully"}
  end

  def render("avatar.json", %{avatar: avatar})do
    %{
      name: avatar.nick_name,
      pic_url: avatar.pic_url
    }
  end

end
