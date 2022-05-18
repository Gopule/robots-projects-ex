defmodule RobotsWeb.QueryMutation.UpdateStudentTest do
  use RobotsWeb.ConnCase, async: true
  alias Robots.Students.Student

  @query """
  mutation UpdateStudent($id: ID!, $name: String, $email: String, $skill: String, $pic: String) {
    updateStudent(id: $id, name: $name, email: $email, skill: $skill, pic: $pic) {
      id
      name
      email
      skill
    }
  }
  """

  describe "update_student" do
    test "updates a student with valid input" do
      %Student{id: student_id} =
        insert(:student, name: "Jimmy Butler", email: "jbutler@email.com", skill: "Basketball")

      update_fields = %{
        id: student_id,
        name: "John Adams",
        email: "jadams@email.com",
        skill: "Public Speaking"
      }

      student_id = student_id |> Integer.to_string()

      assert %{
               "data" => %{
                 "updateStudent" => %{
                   "id" => ^student_id,
                   "name" => "John Adams",
                   "email" => "jadams@email.com",
                   "skill" => "Public Speaking"
                 }
               }
             } = graphql_request(@query, update_fields)
    end

    test "return error when given invalid id" do
      invalid_update_fields = %{
        id: 1,
        name: "John Adams"
      }

      assert %{
               "errors" => [
                 %{
                   "message" => _error
                 }
               ]
             } = graphql_request(@query, invalid_update_fields)
    end
  end
end
