defmodule Ecom.ViewProductsController do
  use Ecom.Web, :controller

  def index(conn, params) do
    render conn, "index.html"
  end
end
