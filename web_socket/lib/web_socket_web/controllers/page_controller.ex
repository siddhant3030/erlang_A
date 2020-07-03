defmodule WebSocketWeb.PageController do
  use WebSocketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
