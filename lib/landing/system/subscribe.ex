defmodule Landing.Subscribe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Landing.Subscribe


  schema "subscribe" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(%Subscribe{} = subscribe, attrs) do
    subscribe
    |> cast(attrs, [:email])
    |> validate_format(:email, ~r/([\w-\.]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})/)
    |> unique_constraint(:email)
    |> validate_length(:email, min: 4)
    |> validate_required([:email])
  end
end
