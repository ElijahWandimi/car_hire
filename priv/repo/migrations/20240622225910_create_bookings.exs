defmodule CarHire.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :pick_date, :date
      add :loc_from, :string
      add :loc_to, :string
      add :number_of_days, :string
      add :status, :string
      add :date_returned, :date
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:bookings, [:user_id])
  end
end
