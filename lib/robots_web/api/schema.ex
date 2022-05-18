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
          {:ok, student} ->
            {:ok, student}

          {:error, changeset} ->
            {:error, changeset}
        end
      end)
    end

    @desc "Updates a single student."
    field :update_student, :student do
      arg(:id, non_null(:id))
      arg(:name, :string)
      arg(:email, :string)
      arg(:skill, :string)
      arg(:pic, :string)

      resolve(fn _, attrs, _ ->
        case Students.update_student(attrs) do
          {:ok, updated_student} ->
            {:ok, updated_student}

          {:error, _} ->
            {:error, "There was an error updating this student."}
        end
      end)
    end

    @desc "deletes a single student."
    field :delete_student, :student do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: student_id}, _ ->
        Students.delete_student(student_id)
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
