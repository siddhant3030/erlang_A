# defmodule AuthWeb.NotificationChannel do
#   use Phoenix.Channel

#   def join(_topic, _payload, socket) do
#     {:ok, socket}
#   end

#   def handle_in("notification", _payload, socket) do
#     {:reply, {:ok, %{notification: "notifications"}}, socket}
#   end
# end
