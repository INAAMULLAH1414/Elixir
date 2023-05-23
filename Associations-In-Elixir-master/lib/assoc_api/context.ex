defmodule AssocApi.Context do

#require Ecto.Query
#alias Ecto.Query

alias AssocApi.Repo

def add_tags_to_posts(post, tag)do
   change = Ecto.Changeset.change(post)
   post_with_tag = Ecto.Changeset.put_assoc(change, :tags, [tag])
   Repo.update(post_with_tag)
end
end
