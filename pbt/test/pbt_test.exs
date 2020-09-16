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

  property "some description" do
    forall instance_of_type <- type_generator do
      property_expression
    end
  end

  def my_type() do
    term()
  end
end
