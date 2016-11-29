defmodule Ecom.ProdTest do
  use Ecom.ModelCase

  alias Ecom.Prod

  @valid_attrs %{pid: 42, price: "some content", product_desc: "some content", product_img_name: "some content", product_name: "some content", product_quantity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Prod.changeset(%Prod{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Prod.changeset(%Prod{}, @invalid_attrs)
    refute changeset.valid?
  end
end
