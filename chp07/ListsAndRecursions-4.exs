defmodule MyList do

  # Exercise: ListsAndRecursion-4
  # Write a function MyList.span(from, to) that returns a list of the numbers from
  # from up to to.
  def span(from, to), do: map(from..to, &(&1))


  # Common utilities

  def map([], _func),do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

end
  IO.puts MyList.span 1,5
