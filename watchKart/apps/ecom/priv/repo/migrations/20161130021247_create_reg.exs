defmodule Ecom.Repo.Migrations.CreateReg do
  use Ecto.Migration

  def change do
    create table(:regist) do
      add :first_name, :text
      add :last_name, :text
      add :address, :text
      add :city, :text
      add :pin_code, :text
      add :email_add, :text
      add :pass, :text

      timestamps()
    end

  end
end
