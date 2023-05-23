defmodule Users.Repo.Migrations.Students do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :fname, :string
      add :age, :integer
      add :email, :string

    end
  end
end
