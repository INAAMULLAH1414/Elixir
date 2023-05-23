defmodule AssocApi.Repo do
  use Ecto.Repo,
    otp_app: :assoc_api,
    adapter: Ecto.Adapters.Postgres
end
