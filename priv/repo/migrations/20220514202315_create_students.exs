defmodule Robots.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string, null: false
      add :email, :string
      add :skill, :string
      add :pic, :string

      timestamps()
    end
  end
end
