defmodule UsersWeb.StudentController do
  use UsersWeb, :controller

  alias Users.Fun
  alias Users.Students

  def index(conn, _params) do
    students=Fun.all()
    render(conn, "index.html",students: students )
  end

  def new(conn, _params) do
    changeset = Fun.change(%Students{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"students" => student_params}) do
    case Fun.create_student(student_params) do
      {:ok, students} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.student_path(conn, :show, students))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    student = Fun.get!(id)
    render(conn, "show.html", student: student)
  end

  def delete(conn, %{"id" => id}) do
    student = Fun.get!(id)
    {:ok, _student} = Fun.delete(student)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.student_path(conn, :index))
  end


  def edit(conn, %{"id" => id}) do
    student = Fun.get!(id)
    changeset = Fun.change(student)
    render(conn, "edit.html", student: student, changeset: changeset)
  end

  def update(conn, %{"id" => id, "students" => student_params}) do
    student = Fun.get!(id)
    case Fun.edit(student, student_params) do
      {:ok, student} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.student_path(conn, :show, student))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", student: student, changeset: changeset)
    end
  end
end