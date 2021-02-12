defmodule BlogPhoenix.Game do
  defstruct [:status, :players, :winning_player]

  @type status :: :not_started | :in_progress | :finished

  @type t :: %__MODULE__{
    status: status(),
    players: {Player.t(), Player.t()} | nil,
    winning_player: Player.t() | nil
  }

  def status_message(game) do
    case game.status do
      :not_started ->
        "Waiting for players to join..."

      :in_progress ->
        {player1, player2} = game.players
        "Game on: #{player1.username} vs #{player2.username}."

      :finished ->
        "Player #{game.winning_player.username} wins!"
    end
  end
end
