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
end
