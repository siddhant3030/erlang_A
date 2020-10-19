defmodule VideoChat.Accounts do
  alias VideoChat.Repo
  alias VideoChat.Accounts.User

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_params(params) do
    Repo.get_by!(User, params)
  end

  def list_users do
    Repo.all(User)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(user)
    |> Repo.insert()
  end
end
