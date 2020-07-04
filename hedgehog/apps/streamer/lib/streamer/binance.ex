defmodule Streamer.Binance do
  use WebSockex
  @stream_endpoint "wss://stream.binance.com:9443/ws/"

  def start_link(symbol, state) do
    WebSockex.start_link("#{@stream_endpoint}#{symbol}@trade", __MODULE__, state)
  end

  def handle_frame({type, msg}, state) do
    case Jason.decode(msg) do
      {:ok, event} -> handle_event(event, state)
      {:error, _} -> throw("Unable to parse msg #{msg}")
    end

    {:ok, state}
  end

  def handle_event(%{"e" => "trade"} = event, state) do
    trade_event = %Streamer.Binance.TradeEvent{
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

    IO.inspect(trade_event, label: "Trade event received: ")
  end
end
