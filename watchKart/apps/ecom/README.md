# Ecom

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


To check the GenServer functionality: Enter the following commands in a terminal in the Directory: FinalProject/final/watchKart/apps/ecom 

   iex -S mix  
   alias Ecom.CostIncrementar, as: CI
   CI.set("price", "5124")
   CI.get("price")
   CI.set("product_quantity", 14)
   CI.get("product_quantity")

   #r CostIncrementar
