defmodule Users.Students do
  use Ecto.Schema
  import Ecto.Changeset


  schema "students" do
    field :name, :string
    field :fname, :string
    field :age, :integer
    field :email, :string
  end


  def changeset(students, attrs) do
    students
    |> cast(attrs, [:name, :fname, :age, :email])
    |> validate_required([:name, :fname, :age, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_inclusion(:age, 18..50)
  end
end