defmodule Ecom.RegisterController do
  use Ecom.Web, :controller

  def index(conn, params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    render(conn, "index.html")
  end

end
