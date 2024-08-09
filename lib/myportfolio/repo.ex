defmodule Myportfolio.Repo do
  use Ecto.Repo,
    otp_app: :myportfolio,
    adapter: Ecto.Adapters.MyXQL
end
