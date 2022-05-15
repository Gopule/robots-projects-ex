defmodule Robots.StudentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Robots.Students` context.
  """

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        pic: "some pic",
        skill: "some skill"
      })
      |> Robots.Students.create_student()

    student
  end
end
