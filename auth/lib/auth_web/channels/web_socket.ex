defmodule Auth.WebSocket do
  defstruct [:topic, :event, :payload]
end

defimpl Auth.Notifications, for: Auth.WebSocket do
  alias DiscordBackendWeb.Endpoint

  def send(n) do
    Endpoint.broadcast(n.topic, n.event, n.payload)
  end
end
