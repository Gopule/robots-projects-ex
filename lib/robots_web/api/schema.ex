defmodule RobotsWeb.Api.Schema do
  use Absinthe.Schema
  alias Robots.Students

  object :student do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, :string
    field :skill, :string
    field :pic, :string
  end

  mutation do
    @desc "Creates a single student."
    field :create_student, :student do
      arg(:name, non_null(:string))
      arg(:email, :string)
      arg(:skill, :string)
      arg(:pic, :string)

      resolve(fn _, attrs, _ ->
        case Students.create_student(attrs) do
          {:error, changeset} ->
            {:error, changeset}

          {:ok, student} ->
            {:ok, student}
        end
      end)
    end
  end

  query do
    @desc "Look up students."
    field :students, list_of(:student) do
      resolve(fn _, _, _ ->
        Students.list_students()
      end)
    end

    @desc "Look up a single student."
    field :student, :student do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: student_id}, _ ->
        Students.get_student(student_id)
      end)
    end
  end
end
