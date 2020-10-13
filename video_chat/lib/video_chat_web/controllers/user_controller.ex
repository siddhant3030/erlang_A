defmodule VideoChatWeb.UserController do
  use VideoChatWeb, :controller

  alias VideoChat.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
