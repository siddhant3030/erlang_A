# defmodule Cesso do
#   defmacro __using__(_opts) do
#     quote do
#       alias Cesso, as: CSV
#     end
#   end

#   alias Cesso.Parser

#   def decode(source, options \\ []) do
#     rows = Parser.parse(source, options)

#     if options[:strip] do
#       rows = rows |> Stream.map fn columns ->
#         Enum.map columns, &String.strip/1
#       end
#     end

#     if options[:columns] do
#       case options[:columns] do
#         true ->
#           names = rows |> Enum.at(0)
#           rows  = rows |> Stream.drop(1)

#         names ->
#           names = names
#       end

#       rows = rows |> Stream.map fn columns ->
#         Enum.zip(names, columns) |> Enum.into %{}
#       end
#     end

#     if as = options[:as] do
#       rows = rows |> Stream.map fn columns ->
#         if options[:columns] do
#           as.new(columns)
#         else
#           [as | columns] |> List.to_tuple
#         end
#       end
#     end

#     rows
#   end
# end
