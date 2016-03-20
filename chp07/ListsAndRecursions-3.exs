defmodule MyList do

  # Exercise: ListsAndRecursion-3
  # An Elixir single-quoted string is actually a list of individual character
  # codes. Write a caesar(list, n) function that adds n to each list element,
  # wrapping if the addition results in a character greater than z.
  # iex> MyList.caesar('ryvkve', 13)
  # ?????? :)
  def caesar(word, key), do: map(word, &(rem((&1 + key), ?z)))

  # Common utilities

  def map([], _func),do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

end
  IO.puts MyList.caesar('ryvkve', 13)
