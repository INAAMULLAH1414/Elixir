defmodule UsersWeb.StudentController do
  use UsersWeb, :controller

  alias Users.Fun
  alias Users.Students


  action_fallback UsersWeb.FallbackController


  def index(conn, _params) do
      students=Fun.all()
      render(conn, "index.json", students: students)
  end

  def create(conn, %{"students" => student_params}) do
    with {:ok, %Students{} = students} <- Fun.create_student(student_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.student_path(conn, :show, students))
      |> render("show.json", students: students)
    end
  end

  def show(conn, %{"id" => id}) do
    student= Fun.get!(id)
    render(conn, "show.json", student: student)
  end

  def update(conn, %{"id" => id, "students" => student_params}) do
    students = Fun.get!(id)

    with {:ok, %Students{} = students} <- Fun.update(students, student_params) do
      render(conn, "show.json", students: students)
    end
  end

  def delete(conn, %{"id" => id}) do
    students = Fun.get!(id)

    with {:ok, %Students{}} <- Fun.delete(students) do
      send_resp(conn, :no_content, "")
    end
  end

end
