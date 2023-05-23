defmodule AssocApi.Tag do
  use Ecto.Schema

  schema "tags" do
    field :name, :string
    many_to_many :posts, AssocApi.Post, join_through: "posts_tags", on_delete: :delete_all
  end

  def changeset(tag, attrs \\ %{}) do
    tag
    |> Ecto.Changeset.cast(attrs, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
