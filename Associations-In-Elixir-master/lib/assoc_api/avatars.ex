defmodule AssocApi.Avatars do
  require Ecto.Query
  alias Ecto.Query
  alias AssocApi.{Repo,Avatar}

  def create_avatar(params \\ %{})do
   Avatar.changeset(%Avatar{}, params)
   |> Repo.insert()
  end

  def all_avatars(id)do
    query =  Query.from a in Avatar,
              where: a.user_id == ^id,
              select: a

    Repo.all(query) |> Repo.preload(:user)
  end

  def get_avatar(id) do
    query = Query.from a in Avatar,
            where: a.id == ^id,
            select: a

    Repo.one(query) |> Repo.preload(:user)
  end

  def delete_avatar(id)do
    avatar = get_avatar(id)
    Repo.delete(avatar)
  end

  def delete_by_user_id(user_id)do
    query = Query.from a in Avatar,
            where: a.user_id == ^user_id,
            select: a

      Repo.one(query)
      |> Repo.delete()
  end

  def get_avatar_by_user_id(user_id)do
    query = Query.from a in Avatar,
    where: a.user_id == ^user_id,
    select: a

   Repo.one(query)
  end

  def update_avatar(avatar, params)do
    Avatar.changeset(avatar, params)
    |> Repo.update()
   end
end
