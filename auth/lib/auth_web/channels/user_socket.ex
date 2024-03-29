defmodule AuthWeb.UserSocket do
  use Phoenix.Socket
  alias Phoenix.Token
  require Logger

  ## Channels
  # channel "notification", AuthWeb.NotificationChannel
  # channel "ping", AuthWeb.PingChannel
  # channel "ping", AuthWeb.PingChannel


  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  # @impl true
  # def connect(%{"token" => token}, socket) do
  #   case verify(socket, connect) do
  #     {:ok, user_id} ->
  #       socket = assign(socket, :user_id, user_id) ->
  #         {:ok, socket}
  #       {:error, err} ->
  #         Logger.error("#{__MODULE__} connect error #{inspect(err)}")
  #         :error
  #   end
  # end

  # @one_day 86400
  # defp verify(socket, token), do: Verify(socket, "salt identifier", token, max_age: @one_day)
  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     AuthWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  @impl true
  def id(_socket), do: nil
end
