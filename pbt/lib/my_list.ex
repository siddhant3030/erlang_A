defmodule MyList do
  def uniq([]), do: []

  def uniq([head | tail]) do
    [head | for(x <- uniq(tail), x != head, do: x)]
  end
end
