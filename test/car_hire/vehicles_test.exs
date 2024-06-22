defmodule CarHire.VehiclesTest do
  use CarHire.DataCase

  alias CarHire.Vehicles

  describe "vehicles" do
    alias CarHire.Vehicles.Vehicle

    import CarHire.VehiclesFixtures

    @invalid_attrs %{description: nil, year: nil, color: nil, make: nil, car_model: nil, image_url: nil, price_per_day: nil}

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Vehicles.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Vehicles.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      valid_attrs = %{description: "some description", year: 42, color: "some color", make: "some make", car_model: "some car_model", image_url: "some image_url", price_per_day: "120.5"}

      assert {:ok, %Vehicle{} = vehicle} = Vehicles.create_vehicle(valid_attrs)
      assert vehicle.description == "some description"
      assert vehicle.year == 42
      assert vehicle.color == "some color"
      assert vehicle.make == "some make"
      assert vehicle.car_model == "some car_model"
      assert vehicle.image_url == "some image_url"
      assert vehicle.price_per_day == Decimal.new("120.5")
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicles.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      update_attrs = %{description: "some updated description", year: 43, color: "some updated color", make: "some updated make", car_model: "some updated car_model", image_url: "some updated image_url", price_per_day: "456.7"}

      assert {:ok, %Vehicle{} = vehicle} = Vehicles.update_vehicle(vehicle, update_attrs)
      assert vehicle.description == "some updated description"
      assert vehicle.year == 43
      assert vehicle.color == "some updated color"
      assert vehicle.make == "some updated make"
      assert vehicle.car_model == "some updated car_model"
      assert vehicle.image_url == "some updated image_url"
      assert vehicle.price_per_day == Decimal.new("456.7")
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicles.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Vehicles.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Vehicles.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Vehicles.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Vehicles.change_vehicle(vehicle)
    end
  end
end
