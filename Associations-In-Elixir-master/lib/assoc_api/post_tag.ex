defmodule AssocApi.PostTag do
  use Ecto.Schema

  schema "posts_tags" do
    belongs_to :post, AssocApi.Post
    belongs_to :tag, AssocApi.Tag
  end
end
