defmodule JitsJournal.Accounts.Registration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "registrations" do
    field :username, :string
    field :password, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(registration, attrs) do
    registration
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end
