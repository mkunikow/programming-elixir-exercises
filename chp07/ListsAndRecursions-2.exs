defmodule MyList do

  # Exercise: ListsAndRecursion-2
  # Write a max(list) that returns the element with the maximum value in the
  # list. (This is slightly trickier than it sounds.)

  def max_in_list(list = [head |_tail]), do: reduce(list, head, &(max(&1, &2)))

  # Common utilities

  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

end
  IO.puts MyList.max_in_list [2, 3, 4]
