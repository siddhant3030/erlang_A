defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")
    heroes = DungeonCrawl.Heroes.all()
    heroes |> Enum.map(& &1.name) |> display_options
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end
end

# heroes |> Enum.map(& &1.name)
# ["Knight", "Wizard", "Rouge"]
# iex(4)> a = heroes |> Enum.map(& &1.name)
# ["Knight", "Wizard", "Rouge"]
# iex(5)> Enum.with_index(a)
# [{"Knight", 0}, {"Wizard", 1}, {"Rouge", 2}]
