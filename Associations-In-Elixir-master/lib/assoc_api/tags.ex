defmodule AssocApi.Tags do
  require Ecto.Query
  alias Ecto.Query
  alias AssocApi.{Repo, Tag}


  def create_tag(params \\ %{}) do
    %Tag{}
    |> Tag.changeset(params)
    |> Repo.insert()
  end

  def get_tag(id)do
    query = Query.from t in Tag,
            where: t.id == ^id,
            select: t

        Repo.one(query) |> Repo.preload(:posts)
  end

  def delete_tag(id)do
    get_tag(id)
    |> Repo.delete()
  end

  def update_tag(id, params \\ %{})do
  get_tag(id)
  |> Tag.changeset(params)
  |> Repo.update()
  end

  def get_all_tags()do
    Tag
    |> Repo.all()
  end

end
