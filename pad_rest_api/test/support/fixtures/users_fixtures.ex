defmodule PadRestApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PadRestApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        firstName: "some firstName",
        hashedPass: "some hashedPass",
        lastName: "some lastName",
        middleName: "some middleName"
      })
      |> PadRestApi.Users.create_user()

    user
  end
end
