defmodule JitsJournal.Repo.Migrations.CreateRegistrations do
  use Ecto.Migration

  def change do
    create table(:registrations) do
      add :username, :string
      add :email, :string
      add :password, :string

      timestamps(type: :utc_datetime)
    end
  end
end
