defmodule MyList do
  # The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina
  # (NC), so we have to charge sales tax on orders shipped to these states.
  # The rates can be expressed as a keyword list:2
  # tax_rates = [ NC: 0.075, TX: 0.08 ]
  # Here’s a list of orders:
  # orders = [
  #   [ id: 123,
  #     ship_to:
  #     :NC,
  #     net_amount: 100.00 ],
  #   [ id: 124,
  #     ship_to:
  #     :OK,
  #     net_amount: 35.50 ],
  #   [ id: 125,
  #     ship_to:
  #     :TX,
  #     net_amount: 24.00 ],
  #   [ id: 126,
  #     ship_to:
  #     :TX,
  #     net_amount: 44.80 ],
  #   [ id: 127,
  #     ship_to:
  #     :NC,
  #     net_amount: 25.00 ],
  #   [ id: 128,
  #     ship_to:
  #     :MA,
  #     net_amount: 10.00 ],
  #   [ id: 129,
  #     ship_to:
  #     :CA,
  #     net_amount: 102.00 ],
  #   [ id: 130,
  #     ship_to:
  #     :NC,
  #     net_amount: 50.00 ] ]
  # Write a function that takes both lists and returns a copy of the orders,
  # but with an extra field, total_amount, which is the net plus sales tax. If a
  # shipment is not to NC or TX, there’s no tax applied.


  def calculate_total_amount(tax_rates, orders) do
    set_order_total_amount_f = set_order_total_amount(tax_rates)
    Enum.map(orders, set_order_total_amount_f)
  end

  def set_order_total_amount(tax_rates), do: &set_order_total_amount(tax_rates, &1)

  def set_order_total_amount(tax_rates, [id: _, ship_to: ship_to, net_amount: net_amount] = order) do
    tax = Keyword.get(tax_rates, ship_to, 0)
    Keyword.put_new(order, :total_amount, net_amount + tax)
  end


end

tax_rates =   [ NC: 0.075, TX: 0.08 ]

orders =  [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50  ],
  [ id: 125, ship_to: :TX, net_amount: 24.00  ],
  [ id: 126, ship_to: :TX, net_amount: 44.80  ],
  [ id: 127, ship_to: :NC, net_amount: 25.00  ],
  [ id: 128, ship_to: :MA, net_amount: 10.00  ],
  [ id: 129, ship_to: :CA,net_amount: 102.00  ],
  [ id: 130, ship_to: :NC, net_amount: 50.00  ] ]
 
# IO.inspect MyList.set_order_total_amount([ id: 123, ship_to: :NC, net_amount: 100.00 ])
IO.inspect MyList.set_order_total_amount(tax_rates, [ id: 123, ship_to: :NC, net_amount: 100.00 ])
IO.inspect MyList.set_order_total_amount(tax_rates, [ id: 124, ship_to: :CA, net_amount: 100.00 ])
IO.inspect MyList.set_order_total_amount(tax_rates).([ id: 124, ship_to: :CA, net_amount: 100.00 ])
IO.inspect MyList.calculate_total_amount(tax_rates, orders)
