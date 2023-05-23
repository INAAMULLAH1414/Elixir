defmodule AssocApi.Post do
  use Ecto.Schema

  schema "posts" do
    field :header, :string
    field :body , :string
    belongs_to :user, AssocApi.User
    many_to_many :tags, AssocApi.Tag, join_through: "posts_tags" , on_delete: :delete_all
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> Ecto.Changeset.cast(attrs, [:header, :body])
    |> Ecto.Changeset.validate_required([:header, :body])
  end
end
