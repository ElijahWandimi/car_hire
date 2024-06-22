defmodule CarHire.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "vehicles" do
    field :description, :string
    field :year, :integer
    field :color, :string
    field :make, :string
    field :car_model, :string
    field :image_url, :string
    field :price_per_day, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:make, :car_model, :image_url, :year, :color, :description, :price_per_day])
    |> validate_required([:make, :car_model, :image_url, :year, :color, :description, :price_per_day])
  end
end
