defmodule DistfunSimple.ClusterManager do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    # 1.
    :net_kernel.monitor_nodes(true)

    state = %{
      me: node(),
      other_nodes: []
    }

    {:ok, state}
  end

  # ...

  def get_all_nodes() do
    GenServer.call(__MODULE__, :get_all_nodes)
  end

  # ...

  def handle_call(:get_all_nodes, _from, state) do
    all_nodes = [state.me] ++ state.other_nodes
    {:reply, all_nodes, state}
  end

  def handle_info({:nodeup, node}, state) do
    sorted_other_nodes = Enum.sort([node | state.other_nodes])
    new_state = %{state | other_nodes: sorted_other_nodes}

    {:noreply, new_state}
  end

  def handle_info({:nodedown, node}, state) do
    new_state = %{state | other_nodes: state.other_nodes -- [node]}

    {:noreply, new_state}
  end
end
