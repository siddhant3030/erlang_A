defmodule Auth.MacroName do
  defmacro double(x) do
    quote do
      unquote(x) + unquote(x)
    end

    IO.inspect(x, label: "one")
  end
end
