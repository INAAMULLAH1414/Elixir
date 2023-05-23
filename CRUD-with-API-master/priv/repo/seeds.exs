# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Users.Repo.insert!(%Users.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Users.Repo
alias Users.Students

Repo.insert! %Students{name: "Abdul Rehman", fname: "Abdul Raouf", age: 18, email: "abdulrehman@gmail.com"}
Repo.insert! %Students{name: "Hamza", fname: "Ghafoor", age: 18, email: "hamza@gmail.com"}
