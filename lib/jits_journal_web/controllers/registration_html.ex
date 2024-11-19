defmodule JitsJournalWeb.RegistrationHTML do
  use JitsJournalWeb, :html

  embed_templates "registration_html/*"

  @doc """
  Renders a registration form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def registration_form(assigns)
end
