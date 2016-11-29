defmodule Ecom.Repo.Migrations.CreateProd do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :pid, :integer
      add :product_name, :text
      add :product_desc, :text
      add :product_img_name, :text
      add :product_quantity, :integer
      add :price, :text

      timestamps()
    end

  end
end
