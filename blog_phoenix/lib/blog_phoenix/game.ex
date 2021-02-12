defmodule BlogPhoenix.Game do
  defstruct [:status, :players, :winning_player]

  @type status :: :not_started | :in_progress | :finished

  @type t :: %__MODULE__{
    status: status(),
    players: {Player.t(), Player.t()} | nil,
    winning_player: Player.t() | nil
  }
end
