defmodule EctoAssoc.Repo.Migrations.ModifyAvatarUserId do
  use Ecto.Migration

  def change do
      drop constraint(:avatars, "avatars_user_id_fkey")

    alter table(:avatars)do
      modify :user_id, references(:users, on_delete: :delete_all)
    end

  end
end
