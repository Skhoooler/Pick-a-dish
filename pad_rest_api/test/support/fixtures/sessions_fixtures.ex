defmodule PadRestApi.SessionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PadRestApi.Sessions` context.
  """

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        sessionID: "some sessionID"
      })
      |> PadRestApi.Sessions.create_session()

    session
  end
end
