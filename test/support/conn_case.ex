defmodule RobotsWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use RobotsWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import RobotsWeb.ConnCase
      import Robots.Factory

      alias RobotsWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint RobotsWeb.Endpoint

      defp graphql_request(query) do
        build_conn()
        |> post("/api", query: query)
        |> json_response(200)
      end

      defp graphql_request(query, variables) do
        build_conn()
        |> post("/api", query: query, variables: variables)
        |> json_response(200)
      end
    end
  end

  setup tags do
    pid = Sandbox.start_owner!(Robots.Repo, shared: not tags[:async])
    on_exit(fn -> Sandbox.stop_owner(pid) end)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
