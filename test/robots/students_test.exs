defmodule Robots.StudentsTest do
  use Robots.DataCase

  alias Robots.Students

  describe "students" do
    alias Robots.Students.Student

    import Robots.StudentsFixtures

    @invalid_attrs %{email: nil, name: nil, pic: nil, skill: nil}

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Students.list_students() == [student]
    end

    test "get_student/1 returns the student with given id" do
      student = student_fixture()
      assert Students.get_student(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{
        email: "some email",
        name: "some name",
        pic: "some pic",
        skill: "some skill"
      }

      assert {:ok, %Student{} = student} = Students.create_student(valid_attrs)
      assert student.email == "some email"
      assert student.name == "some name"
      assert student.pic == "some pic"
      assert student.skill == "some skill"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Students.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()

      update_attrs = %{
        email: "some updated email",
        name: "some updated name",
        pic: "some updated pic",
        skill: "some updated skill"
      }

      assert {:ok, %Student{} = student} = Students.update_student(student, update_attrs)
      assert student.email == "some updated email"
      assert student.name == "some updated name"
      assert student.pic == "some updated pic"
      assert student.skill == "some updated skill"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Students.update_student(student, @invalid_attrs)
      assert student == Students.get_student(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Students.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Students.get_student(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Students.change_student(student)
    end
  end
end
