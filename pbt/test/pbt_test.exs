defmodule PbtTest do
  use ExUnit.Case
  doctest Pbt
  use PropCheck

  property "always works" do
    forall type <- term() do
      boolean(type)
    end
  end

  def boolean(_) do
    true
  end
end
