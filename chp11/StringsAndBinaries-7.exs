# Exercise: StringsAndBinaries-7

# Chapter 7 had an exercise about calculating sales tax on page 108. We
# now have the sales information in a file of comma-separated id, ship_to,
# and amount values. The file looks like this:
# id,ship_to,net_amount
# 123,:NC,100.00
# 124,:OK,35.50
# 125,:TX,24.00
# 126,:TX,44.80
# 127,:NC,25.00
# 128,:MA,10.00
# 129,:CA,102.00
# 120,:NC,50.00
# Write a function that reads and parses this file and then passes the result
# to the sales_tax function. Remember that the data should be formatted into
# a keyword list, and that the fields need to be the correct types (so the id
#                                                                   field is an integer, and so on).

# You’ll need the library functions File.open, IO.read(file, :line), and IO.stream(file).


# tax_rates = [ NC: 0.075, TX: 0.08 ]
# Here’s a list of orders:


# orders = [
#   [ id: 123, ship_to: :NC, net_amount: 100.00 ],
#   [ id: 124, ship_to: :OK, net_amount: 35.50 ],
#   [ id: 125, ship_to: :TX, net_amount: 24.00 ],
#   [ id: 126, ship_to: :TX, net_amount: 44.80 ],
#   [ id: 127, ship_to: :NC, net_amount: 25.00 ],
#   [ id: 128, ship_to: :MA, net_amount: 10.00 ],
#   [ id: 129, ship_to: :CA, net_amount: 102.00 ],
#   [ id: 130, ship_to: :NC, net_amount: 50.00 ]
# ]



defmodule MyString do
  def read_orders(filename) do
      if File.exists?(filename) do
        stream = File.stream!(filename, [:read, :utf8], :line) |> Stream.drop(1)
        data = Enum.reduce stream, [], fn(line, listing) ->
          [process_line(line) | listing]
        end
        Enum.reverse data
      end
  end

  def process_line(line) do
    [id, ship_to, net_amount] = String.split(line, ",")
    [
      id: String.to_integer(id),
      ship_to: ship_to |>  String.replace_prefix(":", "") |> String.to_atom,
      net_amount: net_amount |> String.strip |>  String.to_float
    ]
  end


  def calculate_total_amount_from_file(tax_rates, filename) do
    orders = read_orders(filename) 
    Enum.map(orders, set_order_total_amount(tax_rates))
  end

  def calculate_total_amount(tax_rates, orders) do
    Enum.map(orders, set_order_total_amount(tax_rates))
  end

  def set_order_total_amount(tax_rates), do: &set_order_total_amount(tax_rates, &1)

  def set_order_total_amount(tax_rates, [id: _, ship_to: ship_to, net_amount: net_amount] = order) do
    tax = Keyword.get(tax_rates, ship_to, 0)
    Keyword.put_new(order, :total_amount, net_amount + tax)
  end


end

# IO.inspect MyString.process_line "123,:NC,100.00"
# IO.inspect MyString.read_orders "./StringsAndBinaries-7-data.csv"

tax_rates =   [ NC: 0.075, TX: 0.08 ]

IO.inspect MyString.calculate_total_amount_from_file(tax_rates, "./StringsAndBinaries-7-data.csv")




