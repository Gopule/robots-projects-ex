defmodule Robots.Students do
  @moduledoc """
  The Students context.
  """

  import Ecto.Query, warn: false
  alias Robots.Repo

  alias Robots.Students.Student

  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students do
    {:ok, Repo.all(Student)}
  end

  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student(123)
      %Student{}

      iex> get_student(456)
      {:error, error_message}

  """
  def get_student(id) do
    case Repo.get(Student, id) do
      %Student{} = student ->
        {:ok, student}

      _ ->
        {:error, "A student with this ID was not found."}
    end
  end

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(%{field: new_value})
      {:ok, %Student{}}

      iex> update_student(%{field: bad_value})
      {:error, error}

  """
  def update_student(%{id: student_id} = attrs) do
    with {:ok, %Student{} = student} <- get_student(student_id) do
      student
      |> Student.changeset(attrs |> Map.delete(:id))
      |> Repo.update()
    else
      error -> error
    end
  end

  @doc """
  Deletes a student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(student_id) do
    with {:ok, student} <- get_student(student_id),
         {:ok, student} <- Repo.delete(student) do
      {:ok, student}
    else
      error -> error
    end
  end
end
