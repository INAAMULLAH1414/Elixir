defmodule EctoAssoc.Repo.Migrations.ModifyPostTagPostIdTagId do
  use Ecto.Migration

  def change do

      drop constraint(:posts_tags, "posts_tags_post_id_fkey")
      drop constraint(:posts_tags, "posts_tags_tag_id_fkey")


    alter table (:posts_tags)do

      modify :tag_id, references(:tags, on_delete: :delete_all)
      modify :post_id, references(:posts, on_delete: :delete_all)
    end
  end


end
