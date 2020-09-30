defmodule Streamer.Binance do
  use WebSockex
  alias Streamer.Binance.TradeEvent
  require Logger
  @stream_endpoint "wss://stream.binance.com:9443/ws/"

  def start_link(symbol, state) do
    WebSockex.start_link("#{@stream_endpoint}#{symbol}@trade", __MODULE__, state)
  end

  def handle_frame({_type, msg}, state) do
    case Jason.decode(msg) do
      {:ok, event} -> handle_event(event, state)
      {:error, _} -> throw("Unable to parse msg #{msg}")
    end

    {:ok, state}
  end

  def handle_event(%{"e" => "trade"} = event, _state) do
    trade_event = %TradeEvent {
      :event_type => event["e"],
      :event_time => event["E"],
      :symbol => event["s"],
      :trade_id => event["a"],
      :price => event["p"],
      :quantity => event["q"],
      :buyer_order_id => event["f"],
      :seller_order_id => event["l"],
      :trade_time => event["T"],
      :buyer_market_maker => event["m"]
    }
  end

  Logger.debug(
    "Trade event received " <>
    "#{trade_event.symbol}@#{trade_event.price}"
  )

  Naive.send_event(trade_event)
end
