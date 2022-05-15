defmodule Robots.Factory do
  use ExMachina.Ecto, repo: Robots.Repo

  @moduledoc false

  alias Robots.Students.Student
  alias Faker.{Internet, Person}

  def student_factory do
    %Student{
      name: Person.En.name(),
      email: Internet.email(),
      skill: "Studying",
      pic:
        "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/sitlaborecorrupti.jpg"
    }
  end
end
