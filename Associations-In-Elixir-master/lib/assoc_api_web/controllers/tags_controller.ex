defmodule AssocApiWeb.TagsController do
  use AssocApiWeb, :controller
  alias AssocApi.Tags

  def index(conn, _parmas)do
    tags = Tags.get_all_tags()
    render(conn, "index.json", tags: tags)
  end


  def create(conn, params) do
    tag = Tags.create_tag(params)
    case tag do
      {:ok, _tag} -> render(conn, "create.json")

      {:error, _changeset} -> render(conn, "error.json")
    end
  end

  def show(conn, %{"id" => id})do
    tag = Tags.get_tag(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id} = params)do
    tag = Tags.get_tag(id)
    tag = Tags.update_tag(tag, params)

    case tag do
      {:ok, _tag} -> render(conn, "update.json")
    end
  end

  def delete(conn, %{"id" => id})do
    tag = Tags.get_tag(id)
    tag = Tags.delete_tag(tag)
    case tag do
      {:ok, _tag} -> render(conn, "delete.json")
    end
  end
end
