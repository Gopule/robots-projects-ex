defmodule RobotsWeb.QueryMutation.StudentTest do
  use RobotsWeb.ConnCase, async: true
  alias Robots.Students.Student

  @query """
  query Student($id: ID!) {
    student(id: $id) {
      id
    }
  }
  """

  describe "student" do
    test "returns a student with matching ID" do
      %Student{id: student_id} = insert(:student)

      assert %{"data" => %{"student" => student}} = graphql_request(@query, %{id: student_id})

      student_id = Integer.to_string(student_id)

      assert %{"id" => ^student_id} = student
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
