defmodule Ecom.ProdControllerTest do
  use Ecom.ConnCase

  alias Ecom.Prod
  @valid_attrs %{pid: 42, price: "some content", product_desc: "some content", product_img_name: "some content", product_name: "some content", product_quantity: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, prod_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing products"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, prod_path(conn, :new)
    assert html_response(conn, 200) =~ "New prod"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, prod_path(conn, :create), prod: @valid_attrs
    assert redirected_to(conn) == prod_path(conn, :index)
    assert Repo.get_by(Prod, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, prod_path(conn, :create), prod: @invalid_attrs
    assert html_response(conn, 200) =~ "New prod"
  end

  test "shows chosen resource", %{conn: conn} do
    prod = Repo.insert! %Prod{}
    conn = get conn, prod_path(conn, :show, prod)
    assert html_response(conn, 200) =~ "Show prod"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, prod_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    prod = Repo.insert! %Prod{}
    conn = get conn, prod_path(conn, :edit, prod)
    assert html_response(conn, 200) =~ "Edit prod"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    prod = Repo.insert! %Prod{}
    conn = put conn, prod_path(conn, :update, prod), prod: @valid_attrs
    assert redirected_to(conn) == prod_path(conn, :show, prod)
    assert Repo.get_by(Prod, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    prod = Repo.insert! %Prod{}
    conn = put conn, prod_path(conn, :update, prod), prod: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit prod"
  end

  test "deletes chosen resource", %{conn: conn} do
    prod = Repo.insert! %Prod{}
    conn = delete conn, prod_path(conn, :delete, prod)
    assert redirected_to(conn) == prod_path(conn, :index)
    refute Repo.get(Prod, prod.id)
  end
end
