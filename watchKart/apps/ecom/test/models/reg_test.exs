defmodule Ecom.RegTest do
  use Ecom.ModelCase

  alias Ecom.Reg

  @valid_attrs %{address: "some content", city: "some content", email_add: "some content", first_name: "some content", last_name: "some content", pass: "some content", pin_code: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reg.changeset(%Reg{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reg.changeset(%Reg{}, @invalid_attrs)
    refute changeset.valid?
  end
end
