defmodule FgcBot.Repo do
  use Ecto.Repo,
    otp_app: :fgc_bot,
    adapter: Ecto.Adapters.Postgres
end
