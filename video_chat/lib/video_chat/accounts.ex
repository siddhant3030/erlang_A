defmodule VideoChat.Accounts do

  alias VideoChat.Accounts.User

  def list_users do
    [
      %User{​id:​ ​"​​1"​, ​name:​ ​"​​Josée"​, ​username:​ ​"​​josevalim"​},
      %User{​id:​ ​"​​2"​, ​name:​ ​"​​Joséeee"​, ​username:​ ​"​​josevalim"​},
      %User{​id:​ ​"​​3"​, ​name:​ ​"​​Joséeeee"​, ​username:​ ​"​​josevalim"​},
      %User{​id:​ ​"​​4"​, ​name:​ ​"​​Joséeeeee"​, ​username:​ ​"​​josevalim"​}
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
