defmodule AssocApiWeb.UserView do
  use AssocApiWeb, :view

  def render("index.json", %{users: users})do
    %{data: render_many(users, AssocApiWeb.UserView, "user.json")}
  end

  def render("show.json", %{user: user})do
    %{data: render_one(user, AssocApiWeb.UserView, "user.json")}
  end

  def render("create.json", _params) do

    %{data: "User has been created successfully!"}
  end

  def render("error.json", _params) do

    %{data: "Oops Something went wrong"}
  end

  def render("delete.json", _params)do
    %{data: "User Deleted!"}
  end

  def render("update.json", _params)do
    %{data: "Updated Successfully"}
  end


  def render("user.json", %{user: user})do
    cond do
      user.avatar != nil ->
        %{
          name: user.name,
          email: user.email,
          avatar: %{
            nick_name: user.avatar.nick_name,
            pic_url: user.avatar.pic_url
          }
        }
        user.avatar == nil ->
          %{
            name: user.name,
            email: user.email,
            avatar: nil
          }
    end
  end
end
