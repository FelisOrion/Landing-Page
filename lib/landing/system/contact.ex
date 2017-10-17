defmodule Landing.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias Landing.Contact


  schema "contact" do
    field :email, :string
    field :message, :string
    field :name, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs) do
    contact
    |> cast(attrs, [:name, :email, :subject, :message])
    |> validate_required([:name, :email, :subject, :message])
    |> validate_format(:email, ~r/([\w-\.]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})/)
    |> unique_constraint(:email)
    |> validate_length(:email, min: 4)
    |> validate_length(:name, min: 2)
    |> validate_length(:subject, min: 4)
    |> validate_length(:message, min: 4)
  end
end
