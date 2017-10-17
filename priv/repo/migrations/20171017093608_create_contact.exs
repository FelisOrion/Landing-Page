defmodule Landing.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contact) do
      add :name, :string
      add :email, :string
      add :subject, :text
      add :message, :text

      timestamps()
    end

    create unique_index :contact, [:email]
  end
end
