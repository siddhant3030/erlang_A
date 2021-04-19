defmodule Auth.Macro do

  def M do
    quote do:
      def add(x + y) do
        x + y
      end
  end
end
