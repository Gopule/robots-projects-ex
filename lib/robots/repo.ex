defmodule Robots.Repo do
  use Ecto.Repo,
    otp_app: :robots,
    adapter: Ecto.Adapters.Postgres
end
