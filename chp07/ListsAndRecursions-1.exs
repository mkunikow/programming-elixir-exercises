defmodule MyList do
  # Exercise: ListsAndRecursion-1
  # Write a mapsum function that takes a list and a function. It applies the
  # function to each element of the list and then sums the result, so
  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
  # 14

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def   mapsum1(list, func), do: _mapsum1(list, func, 0)
  defp _mapsum1([], _func, total), do: total
  defp _mapsum1([head | tail], func, total), do: _mapsum1(tail, func, func.(head) + total)

  def mapsum2(list, fun), do: sum1(map(list, fun))

  # Common utilities

  def sum1([]), do: 0
  def sum1([head | tail]), do: head + sum1(tail)

  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def map([], _func),do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]
end
  MyList.mapsum  [1, 2, 3], &(&1 * &1)
  MyList.mapsum1 [1, 2, 3], &(&1 * &1)
