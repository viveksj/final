defmodule Ecom.RegControllerTest do
  use Ecom.ConnCase

  alias Ecom.Reg
  @valid_attrs %{address: "some content", city: "some content", email_add: "some content", first_name: "some content", last_name: "some content", pass: "some content", pin_code: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, reg_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing regist"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, reg_path(conn, :new)
    assert html_response(conn, 200) =~ "New reg"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, reg_path(conn, :create), reg: @valid_attrs
    assert redirected_to(conn) == reg_path(conn, :index)
    assert Repo.get_by(Reg, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, reg_path(conn, :create), reg: @invalid_attrs
    assert html_response(conn, 200) =~ "New reg"
  end

  test "shows chosen resource", %{conn: conn} do
    reg = Repo.insert! %Reg{}
    conn = get conn, reg_path(conn, :show, reg)
    assert html_response(conn, 200) =~ "Show reg"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, reg_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    reg = Repo.insert! %Reg{}
    conn = get conn, reg_path(conn, :edit, reg)
    assert html_response(conn, 200) =~ "Edit reg"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    reg = Repo.insert! %Reg{}
    conn = put conn, reg_path(conn, :update, reg), reg: @valid_attrs
    assert redirected_to(conn) == reg_path(conn, :show, reg)
    assert Repo.get_by(Reg, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    reg = Repo.insert! %Reg{}
    conn = put conn, reg_path(conn, :update, reg), reg: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit reg"
  end

  test "deletes chosen resource", %{conn: conn} do
    reg = Repo.insert! %Reg{}
    conn = delete conn, reg_path(conn, :delete, reg)
    assert redirected_to(conn) == reg_path(conn, :index)
    refute Repo.get(Reg, reg.id)
  end
end
