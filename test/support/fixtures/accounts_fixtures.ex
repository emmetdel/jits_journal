defmodule JitsJournal.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JitsJournal.Accounts` context.
  """

  @doc """
  Generate a registration.
  """
  def registration_fixture(attrs \\ %{}) do
    {:ok, registration} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        username: "some username"
      })
      |> JitsJournal.Accounts.create_registration()

    registration
  end
end
