defmodule AssocApi.Posts do
  require Ecto.Query
  alias Ecto.Query
  alias AssocApi.{Repo, Post}


  def create_post(user, params \\ %{}) do
    changeset = Post.changeset(%Post{}, params)
    cond do
      changeset.valid? == true ->
        post = Ecto.build_assoc(user, :posts, changeset.changes)
        Repo.insert(post)
      changeset.valid? == false ->
        {:error , "Invalid Paramteres"}
    end
  end

  def get_specific_posts(id)do
    query = Query.from p in Post,
            where: p.user_id == ^id,
            select: p
    Repo.all(query)
  end

  def get_specific_post(user_id, id)do
    query = Query.from p in Post,
            where: p.user_id == ^user_id and p.id == ^id,
            select: p

      Repo.one(query)
  end

  def update_post(post, params \\ %{})do
    changeset = Post.changeset(post, params)
    Repo.update(changeset)
  end

  def get_post(id)do
    query = Query.from p in Post,
            where: p.id == ^id,
            select: p

            Repo.one(query) |> Repo.preload(:tags)
  end

  def delete_post(post)do
    Repo.delete(post)
  end
  end
