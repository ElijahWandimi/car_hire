defmodule CarHire.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :make, :string
      add :car_model, :string
      add :image_url, :string
      add :year, :integer
      add :color, :string
      add :description, :text
      add :price_per_day, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
