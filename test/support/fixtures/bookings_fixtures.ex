defmodule CarHire.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CarHire.Bookings` context.
  """

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{
        date_returned: ~D[2024-06-21],
        loc_from: "some loc_from",
        loc_to: "some loc_to",
        number_of_days: "some number_of_days",
        pick_date: ~D[2024-06-21],
        status: "some status"
      })
      |> CarHire.Bookings.create_booking()

    booking
  end
end
