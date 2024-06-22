defmodule CarHire.Repo do
  use Ecto.Repo,
    otp_app: :car_hire,
    adapter: Ecto.Adapters.Postgres
end
