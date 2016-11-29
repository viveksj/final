defmodule Ecom.ProdController do
  use Ecom.Web, :controller

  alias Ecom.Prod

  def index(conn, _params) do
    products = Repo.all(Prod)
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Prod.changeset(%Prod{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prod" => prod_params}) do
    changeset = Prod.changeset(%Prod{}, prod_params)

    case Repo.insert(changeset) do
      {:ok, _prod} ->
        conn
        |> put_flash(:info, "Prod created successfully.")
        |> redirect(to: prod_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prod = Repo.get!(Prod, id)
    render(conn, "show.html", prod: prod)
  end

  def edit(conn, %{"id" => id}) do
    prod = Repo.get!(Prod, id)
    changeset = Prod.changeset(prod)
    render(conn, "edit.html", prod: prod, changeset: changeset)
  end
  # def purchase(conn, %{"id" => id}) do
  #   render(conn, "/", prod: prod, changeset: changeset)
  # end

  def update(conn, %{"id" => id, "prod" => prod_params}) do
    prod = Repo.get!(Prod, id)
    changeset = Prod.changeset(prod, prod_params)

    case Repo.update(changeset) do
      {:ok, prod} ->
        conn
        |> put_flash(:info, "Prod updated successfully.")
        |> redirect(to: prod_path(conn, :show, prod))
      {:error, changeset} ->
        render(conn, "edit.html", prod: prod, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prod = Repo.get!(Prod, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(prod)

    conn
    |> put_flash(:info, "Prod deleted successfully.")
    |> redirect(to: prod_path(conn, :index))
  end
end
