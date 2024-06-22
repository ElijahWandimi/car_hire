defmodule CarHire.BookingsTest do
  use CarHire.DataCase

  alias CarHire.Bookings

  describe "bookings" do
    alias CarHire.Bookings.Booking

    import CarHire.BookingsFixtures

    @invalid_attrs %{status: nil, pick_date: nil, loc_from: nil, loc_to: nil, number_of_days: nil, date_returned: nil}

    test "list_bookings/0 returns all bookings" do
      booking = booking_fixture()
      assert Bookings.list_bookings() == [booking]
    end

    test "get_booking!/1 returns the booking with given id" do
      booking = booking_fixture()
      assert Bookings.get_booking!(booking.id) == booking
    end

    test "create_booking/1 with valid data creates a booking" do
      valid_attrs = %{status: "some status", pick_date: ~D[2024-06-21], loc_from: "some loc_from", loc_to: "some loc_to", number_of_days: "some number_of_days", date_returned: ~D[2024-06-21]}

      assert {:ok, %Booking{} = booking} = Bookings.create_booking(valid_attrs)
      assert booking.status == "some status"
      assert booking.pick_date == ~D[2024-06-21]
      assert booking.loc_from == "some loc_from"
      assert booking.loc_to == "some loc_to"
      assert booking.number_of_days == "some number_of_days"
      assert booking.date_returned == ~D[2024-06-21]
    end

    test "create_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_booking(@invalid_attrs)
    end

    test "update_booking/2 with valid data updates the booking" do
      booking = booking_fixture()
      update_attrs = %{status: "some updated status", pick_date: ~D[2024-06-22], loc_from: "some updated loc_from", loc_to: "some updated loc_to", number_of_days: "some updated number_of_days", date_returned: ~D[2024-06-22]}

      assert {:ok, %Booking{} = booking} = Bookings.update_booking(booking, update_attrs)
      assert booking.status == "some updated status"
      assert booking.pick_date == ~D[2024-06-22]
      assert booking.loc_from == "some updated loc_from"
      assert booking.loc_to == "some updated loc_to"
      assert booking.number_of_days == "some updated number_of_days"
      assert booking.date_returned == ~D[2024-06-22]
    end

    test "update_booking/2 with invalid data returns error changeset" do
      booking = booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_booking(booking, @invalid_attrs)
      assert booking == Bookings.get_booking!(booking.id)
    end

    test "delete_booking/1 deletes the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{}} = Bookings.delete_booking(booking)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_booking!(booking.id) end
    end

    test "change_booking/1 returns a booking changeset" do
      booking = booking_fixture()
      assert %Ecto.Changeset{} = Bookings.change_booking(booking)
    end
  end
end
