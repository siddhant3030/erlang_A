defmodule VideoChatWeb.UserView do
  use VideoChatWeb, :view

  alias VideoChat.Video.Accounts

  def first_name(%Accounts.User{content: content}) do
    content
    |> String.split(" , ")
    |> Enum.at(0)
  end
end
