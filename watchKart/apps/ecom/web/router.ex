defmodule Ecom.Router do
  use Ecom.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Ecom do
    pipe_through :browser # Use the default browser stack

    get "/",               PageController,         :index
    get "/login",          LoginController,        :index
    get "/view_products",  ViewProductsController, :index
    get "/view_cart",      ViewCartController,     :index
    get "/contact_us",     ContactUsController,    :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ecom do
  #   pipe_through :api
  # end
end
