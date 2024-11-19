defmodule JitsJournalWeb.RegistrationController do
  use JitsJournalWeb, :controller

  alias JitsJournal.Accounts
  alias JitsJournal.Accounts.Registration

  def index(conn, _params) do
    registrations = Accounts.list_registrations()
    render(conn, :index, registrations: registrations)
  end

  def new(conn, _params) do
    changeset = Accounts.change_registration(%Registration{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"registration" => registration_params}) do
    case Accounts.create_registration(registration_params) do
      {:ok, registration} ->
        conn
        |> put_flash(:info, "Registration created successfully.")
        |> redirect(to: ~p"/registrations/#{registration}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    registration = Accounts.get_registration!(id)
    render(conn, :show, registration: registration)
  end

  def edit(conn, %{"id" => id}) do
    registration = Accounts.get_registration!(id)
    changeset = Accounts.change_registration(registration)
    render(conn, :edit, registration: registration, changeset: changeset)
  end

  def update(conn, %{"id" => id, "registration" => registration_params}) do
    registration = Accounts.get_registration!(id)

    case Accounts.update_registration(registration, registration_params) do
      {:ok, registration} ->
        conn
        |> put_flash(:info, "Registration updated successfully.")
        |> redirect(to: ~p"/registrations/#{registration}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, registration: registration, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    registration = Accounts.get_registration!(id)
    {:ok, _registration} = Accounts.delete_registration(registration)

    conn
    |> put_flash(:info, "Registration deleted successfully.")
    |> redirect(to: ~p"/registrations")
  end
end
