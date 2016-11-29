defmodule Ecom.Prod do
  use Ecom.Web, :model

  schema "products" do
    field :pid, :integer
    field :product_name, :string
    field :product_desc, :string
    field :product_img_name, :string
    field :product_quantity, :integer
    field :price, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pid, :product_name, :product_desc, :product_img_name, :product_quantity, :price])
    |> validate_required([:pid, :product_name, :product_desc, :product_img_name, :product_quantity, :price])
  end
end
