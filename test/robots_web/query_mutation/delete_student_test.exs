defmodule RobotsWeb.QueryMutation.DeleteStudentTest do
  use RobotsWeb.ConnCase, async: true
  alias Robots.Students
  alias Robots.Students.Student

  @query """
  mutation DeleteStudent($id: ID!) {
    deleteStudent(id: $id) {
      id
    }
  }
  """

  describe "delete_student" do
    test "deletes a student with matching ID" do
      %Student{id: student_id} = insert(:student)

      student_id = student_id |> Integer.to_string()

      assert %{"data" => %{"deleteStudent" => %{"id" => ^student_id}}} =
               graphql_request(@query, %{id: student_id})

      assert {:error, "A student with this ID was not found."} = Students.get_student(student_id)
    end

    test "returns an error with no matching ID" do
      assert %{
               "errors" => [
                 %{
                   "message" => error
                 }
               ]
             } = graphql_request(@query, %{id: 1})

      assert error == "A student with this ID was not found."
    end
  end
end
