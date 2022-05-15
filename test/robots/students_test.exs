defmodule Robots.StudentsTest do
  use Robots.DataCase, async: true

  alias Robots.Students
  alias Robots.Students.Student

  describe "list_students/0" do
    test "returns all students" do
      insert_list(3, :student)
      {:ok, students} = Students.list_students()
      assert Enum.count(students) == 3
    end
  end

  describe "get_student/1" do
    test "returns the student with matching id" do
      %Student{id: student_id} = insert(:student)

      assert {:ok, %Student{id: ^student_id}} = Students.get_student(student_id)
    end
  end

  describe "create_student/1 " do
    test "with valid data creates a student" do
      valid_attrs = %{
        email: "some email",
        name: "some name",
        pic: "some pic",
        skill: "some skill"
      }

      assert {:ok, student} = Students.create_student(valid_attrs)

      assert %Student{
               name: "some name",
               email: "some email",
               skill: "some skill",
               pic: "some pic"
             } = student
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Students.create_student(%{id: 1})
    end
  end

  # test "update_student/2 with valid data updates the student" do
  #   student = student_fixture()

  #   update_attrs = %{
  #     email: "some updated email",
  #     name: "some updated name",
  #     pic: "some updated pic",
  #     skill: "some updated skill"
  #   }

  #   assert {:ok, %Student{} = student} = Students.update_student(student, update_attrs)
  #   assert student.email == "some updated email"
  #   assert student.name == "some updated name"
  #   assert student.pic == "some updated pic"
  #   assert student.skill == "some updated skill"
  # end

  # test "update_student/2 with invalid data returns error changeset" do
  #   student = student_fixture()
  #   assert {:error, %Ecto.Changeset{}} = Students.update_student(student, @invalid_attrs)
  #   assert student == Students.get_student(student.id)
  # end

  # test "delete_student/1 deletes the student" do
  #   student = student_fixture()
  #   assert {:ok, %Student{}} = Students.delete_student(student)
  #   assert_raise Ecto.NoResultsError, fn -> Students.get_student(student.id) end
  # end

  # test "change_student/1 returns a student changeset" do
  #   student = student_fixture()
  #   assert %Ecto.Changeset{} = Students.change_student(student)
  # end
end
