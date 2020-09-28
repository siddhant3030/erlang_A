defmodule Todo.Queue do
  @moduledoc """
  A simple queue implementation.
  """

  @doc """
  Enqueue an element to queue.
  """
  def enqueue(element, queue)
  def enqueue(element, []), do: [element]
  def enqueue(element, queue), do: [element | queue |> Enum.reverse()] |> Enum.reverse()

  @doc """
  Get all elements from queue.
  """
  def to_list(queue), do: queue
end
