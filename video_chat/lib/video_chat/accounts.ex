defmodule VideoChat.Accounts do

  alias VideoChat.Accounts.User

  def list_users do
    [
      %User{author: "1", content: "br", title: "tame impala"},
      %User{author: "2", content: "bru", title: "tame impala"},
      %User{author: "3", content: "bruc", title: "tame impala"},
      %User{author: "4", content: "brucee", title: "tame impala"},
      %User{author: "5", content: "bruceee", title: "tame impala"},
      %User{author: "6", content: "bruceeee", title: "tame impala"},
      %User{author: "7", content: "bruceeeee", title: "tame impala"}
    ]
  end

  def get_user(author) do
    Enum.find(list_users(), fn map -> map.author == author end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
