defmodule JitsJournal.AccountsTest do
  use JitsJournal.DataCase

  alias JitsJournal.Accounts

  describe "registrations" do
    alias JitsJournal.Accounts.Registration

    import JitsJournal.AccountsFixtures

    @invalid_attrs %{username: nil, password: nil, email: nil}

    test "list_registrations/0 returns all registrations" do
      registration = registration_fixture()
      assert Accounts.list_registrations() == [registration]
    end

    test "get_registration!/1 returns the registration with given id" do
      registration = registration_fixture()
      assert Accounts.get_registration!(registration.id) == registration
    end

    test "create_registration/1 with valid data creates a registration" do
      valid_attrs = %{username: "some username", password: "some password", email: "some email"}

      assert {:ok, %Registration{} = registration} = Accounts.create_registration(valid_attrs)
      assert registration.username == "some username"
      assert registration.password == "some password"
      assert registration.email == "some email"
    end

    test "create_registration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_registration(@invalid_attrs)
    end

    test "update_registration/2 with valid data updates the registration" do
      registration = registration_fixture()
      update_attrs = %{username: "some updated username", password: "some updated password", email: "some updated email"}

      assert {:ok, %Registration{} = registration} = Accounts.update_registration(registration, update_attrs)
      assert registration.username == "some updated username"
      assert registration.password == "some updated password"
      assert registration.email == "some updated email"
    end

    test "update_registration/2 with invalid data returns error changeset" do
      registration = registration_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_registration(registration, @invalid_attrs)
      assert registration == Accounts.get_registration!(registration.id)
    end

    test "delete_registration/1 deletes the registration" do
      registration = registration_fixture()
      assert {:ok, %Registration{}} = Accounts.delete_registration(registration)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_registration!(registration.id) end
    end

    test "change_registration/1 returns a registration changeset" do
      registration = registration_fixture()
      assert %Ecto.Changeset{} = Accounts.change_registration(registration)
    end
  end
end
