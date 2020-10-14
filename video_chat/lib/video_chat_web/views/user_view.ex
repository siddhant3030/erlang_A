defmodule VideoChatWeb.UserView do
  use VideoChatWeb, :view

  alias VideoChat.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split("")
    |> Enum.at(0)
  end
end
