defmodule TaxCal do
  def compute(tax_percent, amount) do
    offset =
      amount
      |> Money.mult!(100)
      |> Money.div!(100 + tax_percent)
      |> Money.round(currency_digits: :cash)

    tax_value = Money.sub!(amount, offset)
    %{amount: offset, tax: tax_value}
  end

  def compute(tax_percent, amount) do
    tax_value =
      amount
      |> Money.mult!(tax_percent)
      |> Money.div!(100)
      |> Money.round(currency_digits: :cash)

    %{amount: amount, tax: tax_value}
  end
end
