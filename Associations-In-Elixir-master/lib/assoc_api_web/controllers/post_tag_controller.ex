defmodule AssocApiWeb.PostTagController do
  use AssocApiWeb, :controller
  alias AssocApi.{Posts, Tags, Context}
  def update(conn, %{"post_id" => post_id, "tag_id" => tag_id})do
    post = Posts.get_post(post_id)
    tag = Tags.get_tag(tag_id)
    post_with_tag = Context.add_tags_to_posts(post, tag)

    case post_with_tag do
      {:ok, _post} -> render(conn, "post_with_tag.json")

      {:error, _changeset} -> render(conn, "error_post_with_tag.json")
    end
  end
end
