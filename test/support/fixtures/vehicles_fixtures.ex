defmodule CarHire.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CarHire.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        car_model: "some car_model",
        color: "some color",
        description: "some description",
        image_url: "some image_url",
        make: "some make",
        price_per_day: "120.5",
        year: 42
      })
      |> CarHire.Vehicles.create_vehicle()

    vehicle
  end
end
