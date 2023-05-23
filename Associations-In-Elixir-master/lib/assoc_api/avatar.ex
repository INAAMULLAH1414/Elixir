defmodule AssocApi.Avatar do
  use Ecto.Schema

  schema "avatars" do
    field :nick_name, :string
    field :pic_url, :string
    belongs_to :user, AssocApi.User
  end

  def changeset(avatar, params \\ %{}) do
    avatar
    |> Ecto.Changeset.cast(params, [:nick_name, :pic_url, :user_id])
    |> Ecto.Changeset.validate_required([:nick_name, :pic_url, :user_id])

  end
end
