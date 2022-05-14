defmodule RobotsWeb.PageController do
  use RobotsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
