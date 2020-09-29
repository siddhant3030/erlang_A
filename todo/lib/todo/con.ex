# defmodule Todo.Con do
#   plug :introspect
#   plug HelloWeb.Router

#   def introspect(conn, _opts) do
#     IO.puts """
#     Verb: #{inspect(conn.method)}
#     Host: #{inspect(conn.host)}
#     Headers: #{inspect(conn.req_headers)}
#     """

#     conn
#   end
# end
