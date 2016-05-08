# Exercise: StringsAndBinaries-5
# Write a function that takes a list of dqs and prints each on a separate
# line, centered in a column that has the width of the longest string. Make
# sure it works with UTF characters.

defmodule MyString do
  def center ([]) do
    []
  end
  def center (dqs) do
    max_lenght = Enum.max_by(dqs, &String.length/1) |> String.length
    Enum.map(dqs, &(center_middle(&1, max_lenght)))
  end

  def center_middle(str, size) do
    str_size = String.length(str)
    lp  = Kernel.round((size - str_size) / 2) + str_size
    str
        |> String.ljust(lp)
        |> String.rjust(size)
  end

end

IO.inspect MyString.center(["cat", "zebra", "elephant"])
