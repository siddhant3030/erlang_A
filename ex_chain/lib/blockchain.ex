defmodule ExChain.Blockchain do
  @moduledoc """
  This module contains the blockchain related functions
  """
  alias __MODULE__
  alias ExChain.Blockchain.Block

  defstruct ~w(chain)a

  @type t :: %Blockchain{
          chain: [Block.t({})]
        }

  @spec new :: Blockchain.t()
  def new() do
    %__MODULE__{}
    |> add_genesis()
  end

  defp add_genesis(blockchain = %__MODULE__{}) do
    %{blockchain | chain: [Block.genesis()]}
  end

  @spec add_block(BlockChain.t(), any) :: BlockChain.t()
  def add_block(blockchain = %__MODULE__{chain: chain}, data) do
    {last_block, _} = List.pop_at(chain, -1)

    %{blockchain | chain: chain ++ [Block.mine_block(last_block, data)]}
  end
end

# iex(5)> alias ExChain.Blockchain
# ExChain.Blockchain
# iex(6)> blockchain = Blockchain.new
# %ExChain.Blockchain{
#   chain: [
#     %ExChain.Blockchain.Block{
#       data: "genesis data",
#       hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
#       last_hash: "-",
#       timestamp: 1599909623805627
#     }
#   ]
# }
# iex(7)> blockchain = Blockchain.add_block(blockchain, "My first block data")
# %ExChain.Blockchain{
#   chain: [
#     %ExChain.Blockchain.Block{
#       data: "genesis data",
#       hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
#       last_hash: "-",
#       timestamp: 1599909623805627
#     },
#     %ExChain.Blockchain.Block{
#       data: "My first block data",
#       hash: "2D1CC07A9B0B41379ED710CE0C0DE039CACF7BD7BE04032A31A987510F701304",
#       last_hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
#       timestamp: 1622496008623468
#     }
#   ]
# }
# iex(8)> blockchain = Blockchain.add_block(blockchain, "My second block data")
# %ExChain.Blockchain{
#   chain: [
#     %ExChain.Blockchain.Block{
#       data: "genesis data",
#       hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
#       last_hash: "-",
#       timestamp: 1599909623805627
#     },
#     %ExChain.Blockchain.Block{
#       data: "My first block data",
#       hash: "2D1CC07A9B0B41379ED710CE0C0DE039CACF7BD7BE04032A31A987510F701304",
#       last_hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
#       timestamp: 1622496008623468
#     },
#     %ExChain.Blockchain.Block{
#       data: "My second block data",
#       hash: "774326FEAACF99EAC22A78E8915DB169819DFB00BB06D1B9681F576080D3C8FC",
#       last_hash: "2D1CC07A9B0B41379ED710CE0C0DE039CACF7BD7BE04032A31A987510F701304",
#       timestamp: 1622496020530681
#     }
#   ]
# }
# iex(9)>
