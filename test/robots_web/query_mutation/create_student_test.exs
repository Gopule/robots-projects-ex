defmodule RobotsWeb.QueryMutation.CreateStudentTest do
  use RobotsWeb.ConnCase, async: true

  describe "create_student" do
    test "creates a student with valid input" do
      query = """
      mutation CreateStudent($name: String!, $email: String, $skill: String, $pic: String) {
        createStudent(name: $name, email: $email, skill: $skill, pic: $pic) {
          name
        }
      }
      """

      student_name = "Jimmy Butler"

      assert %{"data" => %{"createStudent" => student}} =
               graphql_request(query, %{name: student_name})

      assert %{"name" => ^student_name} = student
    end
  end
end
