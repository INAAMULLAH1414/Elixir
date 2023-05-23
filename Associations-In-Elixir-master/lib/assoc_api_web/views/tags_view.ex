defmodule AssocApiWeb.TagsView do
  use AssocApiWeb, :view

  def render("index.json", %{tags: tags})do

    %{data: render_many(tags, AssocApiWeb.TagsView, "tags.json")}

  end

  def render("create.json", _params) do

    %{data: "Tag has been created successfully!"}
  end

  def render("show.json", %{tag: tag})do

    %{data: render_one(tag, AssocApiWeb.TagsView, "tags.json")}

  end

  def render("error.json", _params) do

    %{data: "Oops Something went wrong"}
  end

  def render("update.json", _params)do
    %{data: "Tag Updated Successfully"}
  end

  def render("delete.json", _params)do
    %{data: "Tag deleted!"}
  end

  def render("tags.json", %{tags: tags})do
    %{
      name: tags.name,
      id: tags.id
    }
  end
end
