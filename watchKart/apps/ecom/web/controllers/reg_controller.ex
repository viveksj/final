defmodule Ecom.RegController do
  use Ecom.Web, :controller

  alias Ecom.Reg

  def index(conn, _params) do
    regist = Repo.all(Reg)
    render(conn, "index.html", regist: regist)
  end

  def new(conn, _params) do
    changeset = Reg.changeset(%Reg{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reg" => reg_params}) do
    changeset = Reg.changeset(%Reg{}, reg_params)

    case Repo.insert(changeset) do
      {:ok, _reg} ->
        conn
        |> put_flash(:info, "Reg created successfully.")
        |> redirect(to: reg_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reg = Repo.get!(Reg, id)
    render(conn, "show.html", reg: reg)
  end

  def edit(conn, %{"id" => id}) do
    reg = Repo.get!(Reg, id)
    changeset = Reg.changeset(reg)
    render(conn, "edit.html", reg: reg, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reg" => reg_params}) do
    reg = Repo.get!(Reg, id)
    changeset = Reg.changeset(reg, reg_params)

    case Repo.update(changeset) do
      {:ok, reg} ->
        conn
        |> put_flash(:info, "Reg updated successfully.")
        |> redirect(to: reg_path(conn, :show, reg))
      {:error, changeset} ->
        render(conn, "edit.html", reg: reg, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reg = Repo.get!(Reg, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reg)

    conn
    |> put_flash(:info, "Reg deleted successfully.")
    |> redirect(to: reg_path(conn, :index))
  end
end
