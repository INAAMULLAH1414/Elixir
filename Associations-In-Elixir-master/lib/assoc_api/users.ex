defmodule AssocApi.Users do
require Ecto.Query
alias Ecto.Query
alias AssocApi.{Repo, User}

def change_user(%User{} = user, attrs \\ %{}) do
  User.changeset(user, attrs)
end

def create_user(params \\ %{}) do
  %User{}
  |> User.changeset(params)
  |> Repo.insert()
end

 def get_user_by_id(id) do
  User
  |> Repo.get(id) |> Repo.preload(:avatar) |> Repo.preload(:posts)
end

 def all_users()do
  query = Query.from u in User,
          select: u

          Repo.all(query) |> Repo.preload(:avatar)
 end

 def delete_user(id)do

  #avatar = Avatars.get_avatar_by_user_id(id)

  #cond do
   # avatar == nil ->
    #  user = get_user_by_id(id)
     # Repo.delete(user)

     #%Avatar{} = avatar ->
      #Avatars.delete_by_user_id(id)
      user = get_user_by_id(id)
      Repo.delete(user)
  #end


 end

 def update_user(user, params)do
  User.changeset(user, params)
  |> Repo.update()
 end
end
