defmodule CarHire.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bookings" do
    field :status, :string
    field :pick_date, :date
    field :loc_from, :string
    field :loc_to, :string
    field :number_of_days, :string
    field :date_returned, :date
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:pick_date, :loc_from, :loc_to, :number_of_days, :status, :date_returned])
    |> validate_required([:pick_date, :loc_from, :loc_to, :number_of_days, :status, :date_returned])
  end
end
