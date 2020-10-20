defmodule VideoChatWeb.UserController do
  use VideoChatWeb, :controller

  alias VideoChat.Accounts
  alias VideoChat.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    {:ok, user} = Accounts.create_user(user_params)

    conn
    |> put_flash(:info, "#{user.name} created!")
  end
end
