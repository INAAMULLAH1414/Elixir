defmodule Users.Fun do

  import Ecto.Query, warn: false
  alias Users.Repo

  alias Users.Students

  def all do
    Repo.all(Students)
  end

  def change(%Students{} = student, attrs \\ %{}) do
    Students.changeset(student, attrs)
  end

  def create_student(attrs \\ %{}) do
    %Students{}
    |> Students.changeset(attrs)
    |> Repo.insert()
  end

  def get!(id), do: Repo.get!(Students, id)

  def delete(%Students{} = student) do
    Repo.delete(student)
  end

  def update(%Students{} = student, attrs) do
    student
    |> Students.changeset(attrs)
    |> Repo.update()
  end



end
