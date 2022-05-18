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

    test "invalid id returns error" do
      assert {:error, "A student with this ID was not found."} = Students.get_student(1)
    end
  end

  describe "create_student/1 " do
    test "with valid fields creates a student" do
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

    test "invalid fields returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Students.create_student(%{id: 1})
    end
  end

  describe "update_student/1 " do
    test "with valid fields updates a student" do
      %Student{id: student_id} =
        insert(:student, name: "Jimmy Butler", email: "jbutler@email.com", skill: "Basketball")

      update_attrs = %{
        id: student_id,
        name: "John Adams",
        email: "jadams@email.com",
        skill: "Public Speaking"
      }

      assert {:ok, %Student{id: ^student_id} = student} = Students.update_student(update_attrs)

      assert %Student{
               name: "John Adams",
               email: "jadams@email.com",
               skill: "Public Speaking"
             } = student
    end

    test "invalid id returns error" do
      assert {:error, "A student with this ID was not found."} =
               Students.update_student(%{id: 1, name: "James Buchanan"})
    end
  end

  describe "delete_student/1" do
    test "deletes the student with matching id" do
      %Student{id: student_id} = insert(:student)

      assert {:ok, %Student{id: ^student_id}} = Students.delete_student(student_id)

      assert {:error, "A student with this ID was not found."} = Students.get_student(student_id)
    end

    test "invalid id returns error" do
      assert {:error, "A student with this ID was not found."} = Students.get_student(1)
    end
  end
end
