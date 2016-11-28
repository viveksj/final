defmodule Ecom.ContactUsController do
  use Ecom.Web, :controller

  def index(conn, params) do
    render conn, "index.html"
  end
end
