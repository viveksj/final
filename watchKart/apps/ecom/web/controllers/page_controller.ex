defmodule Ecom.PageController do
  use Ecom.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end