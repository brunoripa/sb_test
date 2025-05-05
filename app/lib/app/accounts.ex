defmodule App.Accounts do
  use Ash.Domain,
    otp_app: :app

  resources do
    resource App.Accounts.Token
    resource App.Accounts.User
  end
end
