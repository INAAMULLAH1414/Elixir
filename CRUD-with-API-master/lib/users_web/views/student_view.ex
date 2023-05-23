defmodule UsersWeb.StudentView do
  use UsersWeb, :view

  alias UsersWeb.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: students}) do
    %{id: students.id,
      name: students.name,
      fname: students.fname,
      age: students.age,
      email: students.email}
  end
end
