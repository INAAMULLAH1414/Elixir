defmodule AssocApiWeb.PostTagView do
  use AssocApiWeb, :view

  def render("post_with_tag.json", _params)do

    %{data: "Added tag with post"}
  end

  def render("error_post_with_tag.json", _params)do
    %{data: "Oops Something went wrong"}
  end
end
