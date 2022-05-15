defmodule RobotsWeb.QueryMutation.StudentsTest do
  use RobotsWeb.ConnCase, async: true

  describe "students" do
    test "returns list of all robot students" do
      query = """
      query Students {
        students {
          id
        }
      }
      """

      insert_list(3, :student)

      assert %{"data" => %{"students" => students}} = graphql_request(query)
      assert Enum.count(students) == 3
    end
  end
end
