defmodule StableMatching.Preference do
  @enforce_keys [:id, :prefers]
  defstruct id: nil, prefers: []
end

defmodule StableMatching.GaleShapley do
  alias StableMatching.Preference

  @doc """
  Solves [stable matching problem](https://en.wikipedia.org/wiki/Stable_marriage_problem#Algorithm)
  using Gale–Shapley algorithm.
  Accepts lists of `Preference`s `male_preferences` and `female_preferences`,
  returns a list of `id` tuples.
  Assumes that all `id`s inside preferences are unique, and all `id`s from `prefers` lists
  belong to somebody in the opposing preferences list.
  ## Examples
      iex> alias StableMatching.{Preference, GaleShapley}
      iex> male_preferences = [%Preference{id: 1, prefers: [20, 10]}, %Preference{id: 2, prefers: [10, 20]}]
      iex> female_preferences = [%Preference{id: 10, prefers: [2, 1]}, %Preference{id: 20, prefers: [1, 2]}]
      iex> GaleShapley.match(male_preferences, female_preferences)
      [{1, 20}, {2, 10}]
      iex> male_preferences = [%Preference{id: 1, prefers: [20, 10]}, %Preference{id: 2, prefers: [10, 20]}]
      iex> female_preferences = [%Preference{id: 10, prefers: [1, 2]}, %Preference{id: 20, prefers: [2, 1]}]
      iex> GaleShapley.match(male_preferences, female_preferences)
      [{1, 10}, {2, 20}]

  """
  def match(male_preferences, female_preferences) do
    male_map = preferences_list_to_map_by_id(male_preferences)
    female_map = preferences_list_to_map_by_id(female_preferences)
    match_inner(1, male_map, female_map)
  end

  defp match_inner(round, male_map = %{}, female_map = %{}) do
    unengaged_men =
      male_map
      |> Map.values()
      |> Enum.filter(&can_propose?/1)

    unless Enum.empty?(unengaged_men) do
      {male_map, female_map} =
        Enum.reduce(unengaged_men, {male_map, female_map}, fn man, {male_map, female_map} ->
          preferred_woman = Map.get(female_map, get_current_preferred_id(man))

          if accepts_proposal?(round, man.id, preferred_woman) do
            man =
              man
              |> engage(preferred_woman.id)
              |> add_to_already_proposed(preferred_woman.id)

            previously_engaged_man =
              Map.get(male_map, get_current_preferred_id(preferred_woman))
              |> unengage()

            preferred_woman = engage(preferred_woman, man.id)

            male_map =
              male_map
              |> Map.put(man.id, man)
              |> Map.put(previously_engaged_man.id, previously_engaged_man)

            female_map = Map.put(female_map, preferred_woman.id, preferred_woman)
            {male_map, female_map}
          else
            man = add_to_already_proposed(man, preferred_woman.id)
            male_map = Map.put(male_map, man.id, man)
            {male_map, female_map}
          end
        end)

      match_inner(round + 1, male_map, female_map)
    else
      return_matchings(male_map)
    end
  end

  # we have bijection between male and female maps at this point
  # so we need to walk only male map to get all matchings
  defp return_matchings(male_map) do
    male_map
    |> Map.values()
    |> Enum.map(fn man -> {man.id, get_current_engagement(man)} end)
  end

  defp preferences_list_to_map_by_id(preferences) when is_list(preferences) do
    preferences
    |> Enum.map(fn p -> {p.id, p} end)
    |> Enum.into(%{})
  end

  # in first round woman replies "yes" only to the man she prefers the most
  defp accepts_proposal?(
         _round = 1,
         man_id,
         _woman_preference = %Preference{prefers: [preferred_man_id | _]}
       ) do
    man_id == preferred_man_id
  end

  defp accepts_proposal?(_round, man_id, woman_preference = %Preference{}) do
    prefers_over_current?(man_id, woman_preference)
  end

  defp engage(preference = %Preference{}, id) do
    Map.put(preference, :engaged_to, id)
  end

  defp unengage(preference = %Preference{}) do
    Map.delete(preference, :engaged_to)
  end

  defp get_current_engagement(preference = %Preference{}) do
    Map.get(preference, :engaged_to)
  end

  defp engaged?(preference = %Preference{}) do
    get_current_engagement(preference)
  end

  defp can_propose?(preference = %Preference{}) do
    !(engaged?(preference) || Enum.empty?(preference.prefers))
  end

  defp get_current_preferred_id(preference = %Preference{}) do
    hd(preference.prefers -- get_already_proposed(preference))
  end

  defp prefers_over_current?(partner_id, preference = %Preference{}) do
    unless engaged?(preference) do
      true
    else
      new_partner_preference_index = Enum.find_index(preference.prefers, partner_id)

      current_partner_preference_index =
        Enum.find_index(
          preference.prefers,
          get_current_engagement(preference)
        )

      # if current partner is further in the `prefers` list, new partner will be preferred
      current_partner_preference_index > new_partner_preference_index
    end
  end

  defp get_already_proposed(preference = %Preference{}) do
    Map.get(preference, :already_proposed, [])
  end

  defp add_to_already_proposed(preference = %Preference{}, id) do
    already_proposed = get_already_proposed(preference) ++ [id]
    Map.put(preference, :already_proposed, already_proposed)
  end
end
