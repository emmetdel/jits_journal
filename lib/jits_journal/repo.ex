defmodule JitsJournal.Repo do
  use Ecto.Repo,
    otp_app: :jits_journal,
    adapter: Ecto.Adapters.Postgres
end
