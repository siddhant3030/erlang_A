defmodule DistfunSimple.ClusterManager do
  use GenServer

  defmodule State do
    defstruct me: nil, other_nodes: []

    def new(me) do
      %State{me: me, other_nodes: []}
    end

    def all(%State{me: me, other_nodes: other_nodes}) do
      [me | other_nodes]
    end

    def add_node(%State{} = state, node) do
      sorted_other_nodes = Enum.sort([node | state.other_nodes])
      %{state | other_nodes: sorted_other_nodes}
    end

    def remove_node(%State{} = state, node) do
      %{state | other_nodes: state.other_nodes -- [node]}
    end
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    # 1.
    :net_kernel.monitor_nodes(true)

    {:ok, State.new(node())}
  end

  # ...

  def get_all_nodes() do
    GenServer.call(__MODULE__, :get_all_nodes)
  end

  # ...

  def handle_call(:get_all_nodes, _from, state) do
    {:reply, State.all(state), state}
  end

  def handle_info({:nodeup, node}, state) do
    new_state = State.add_node(state, node)

    {:noreply, new_state}
  end

  def handle_info({:nodedown, node}, state) do
    new_state = State.remove_node(state, node)

    {:noreply, new_state}
  end
end
