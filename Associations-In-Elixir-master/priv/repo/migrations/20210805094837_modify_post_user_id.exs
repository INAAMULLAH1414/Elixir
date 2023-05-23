defmodule EctoAssoc.Repo.Migrations.ModifyPostUserId do
  use Ecto.Migration

  def change do
      drop constraint(:posts, "posts_user_id_fkey")

    alter table(:posts) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end

  end
end
