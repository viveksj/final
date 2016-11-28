defmodule Ecom.PageController do
  use Ecom.Web, :controller

  def index(conn, params) do
    status="Login"
    render conn, "index.html"

    # def index(conn, params) do
    #   status="Login"
    #   put_session(conn,"Login",status)
    #   render conn, "index.html"

  end
end
