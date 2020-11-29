defprotocol Animal do
  def greet(arg)
  def speak(arg)
  def warn(arg)
end

defmodule Dog do
  @enforce_keys [:name]
  alias __MODULE__
  defstruct name: ""

  def new(name) do
    %Dog{name: name}
  end

  defimpl Animal, for: Dog do
    def warn(_), do: "growl!"
    def speak(_), do: "gsasassarowl!"
    def greet(_), do: "hello"
  end
end

# Compiling 1 file (.ex)
# Generated auth app
# :ok
# iex(5)> max = Dog.new("max")
# %Dog{name: "max"}
# iex(6)> max |> Animal.speak
# "gsasassarowl!"
# iex(7)>
