defmodule AssocApi.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    has_one :avatar, AssocApi.Avatar, on_delete: :delete_all
    has_many :posts, AssocApi.Post, on_delete: :delete_all
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> Ecto.Changeset.cast(attrs, [:name, :email])
    |> Ecto.Changeset.validate_required([:name, :email])
  end
end
