defmodule Ecom.Reg do
  use Ecom.Web, :model

  schema "regist" do
    field :first_name, :string
    field :last_name, :string
    field :address, :string
    field :city, :string
    field :pin_code, :string
    field :email_add, :string
    field :pass, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :address, :city, :pin_code, :email_add, :pass])
    |> validate_required([:first_name, :last_name, :address, :city, :pin_code, :email_add, :pass])
  end
end
