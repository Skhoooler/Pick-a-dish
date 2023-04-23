defmodule PadRestApi.Repo do
  use Ecto.Repo,
    otp_app: :pad_rest_api,
    adapter: Ecto.Adapters.Postgres
end
