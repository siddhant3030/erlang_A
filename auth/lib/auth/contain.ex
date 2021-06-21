defmodule Y do
  def do_it(list1, list2) do
    index_map = map_items_to_indexes(list2)
    collect_matches(list1, index_map) |> Enum.reverse()
  end

  defp map_items_to_indexes(list, acc \\ %{}, index \\ 0)
  defp map_items_to_indexes([], acc, _), do: acc
  defp map_items_to_indexes([first | rest], acc, index) do
    acc = Map.update(acc, first, [index], & [index | &1])
    map_items_to_indexes(rest, acc, index + 1)
  end

  defp collect_matches(list, index_map, matches \\ [], index \\ 0)
  defp collect_matches([], _, matches, _), do: matches
  defp collect_matches([first | rest], index_map, matches, index) do
    indexes = Map.get(index_map, first, []) |> Enum.reverse()
    matches =
      for match_index <- indexes, reduce: matches do
        matches -> [[index, match_index] | matches]
      end
    collect_matches(rest, index_map, matches, index + 1)
  end
end
