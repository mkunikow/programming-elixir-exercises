# Write a function that returns true if a single-quoted string contains only
# printable ASCII characters (space through tilde).

defmodule MyString do
  def ascii?(input_string), do: Enum.all?(input_string, &(&1 >= ?\s and &1 < ?~))
  def ascii2?(input_string), do: Regex.match?(~r/^[ -~]+$/, to_string(input_string))
end


IO.inspect MyString.ascii?('12')
IO.inspect MyString.ascii?('abcd')
IO.inspect MyString.ascii?(' ')
IO.inspect MyString.ascii2?('12')
IO.inspect MyString.ascii2?('abcd')
IO.inspect MyString.ascii2?(' ')
