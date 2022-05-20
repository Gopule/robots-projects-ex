# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Robots.Repo.insert!(%Robots.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Robots.Students

students = [
  %{
    name: "Ingaberg Orton",
    email: "iorton0@imdb.com",
    skill: "Oracle",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/voluptasdictablanditiis.jpg"
  },
  %{
    name: "Clarke Boards",
    email: "cboards1@weibo.com",
    skill: "Sports",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/voluptasautreprehenderit.jpg"
  },
  %{
    name: "Laurens Romanet",
    email: "lromanet2@wired.com",
    skill: "Employee Handbooks",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/aspernaturnonsapiente.jpg"
  },
  %{
    name: "Berti Skitt",
    email: "bskitt3@aboutads.info",
    skill: "Nutrition Education",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/autautdeserunt.jpg"
  },
  %{
    name: "Mureil Summerley",
    email: "msummerley4@craigslist.org",
    skill: "ISO 14971",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/consequaturdelectusquis.jpg"
  },
  %{
    name: "Robbyn Coryndon",
    email: "rcoryndon5@cargocollective.com",
    skill: "Cinema 4D",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/autautdeserunt.jpg"
  },
  %{
    name: "Sheena Eykel",
    email: "seykel6@examiner.com",
    skill: "Ulead VideoStudio",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/utquamut.jpg"
  },
  %{
    name: "Minnnie Ewen",
    email: "mewen7@ycombinator.com",
    skill: "Vulcan",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/nesciuntrerumlibero.jpg"
  },
  %{
    name: "Rory Iban",
    email: "riban8@hubpages.com",
    skill: "EE4",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/autemporroplaceat.jpg"
  },
  %{
    name: "Lenna Roxby",
    email: "lroxby9@cam.ac.uk",
    skill: "LPS",
    pic:
      "https://storage.googleapis.com/hatchways-app.appspot.com/assessments/data/frontend/images/doloribusquitempora.jpg"
  }
]

Enum.each(students, fn attrs ->
  Students.create_student(attrs)
end)
