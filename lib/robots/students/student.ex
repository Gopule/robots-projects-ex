defmodule Robots.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :email, :string
    field :name, :string
    field :pic, :string
    field :skill, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :email, :skill, :pic])
    |> validate_required([:name])
  end
end
