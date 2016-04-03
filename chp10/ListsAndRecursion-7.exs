defmodule MyList do

  # In the last exercise of Chapter 7, Lists and Recursion, on page 69, you
  # wrote a span function. Use it and list comprehensions to return a list of
  # the prime numbers from 2 to n.

  # http://swizec.com/blog/checking-for-primes-dumber-algorithm-is-faster-algorithm/swizec/1580
  # http://stackoverflow.com/questions/4114167/checking-if-a-number-is-a-prime-number-in-python
  # http://stackoverflow.com/questions/9711785/find-prime-numbers-using-scala-help-me-to-improve

  def primes(n) do
    2..n |> Enum.reduce([], &prime_reduce/2) |> Enum.reverse
  end

  defp prime_reduce(n, acc) do
    if prime?(n, acc), do: [n | acc], else: acc
  end

  defp prime?(n, primes) do
    cond do
      n < 2          -> false
      n == 2         -> true
      rem(n, 2) == 0 -> false
      true           -> primes |>  Enum.all?(&(rem(n, &1) != 0))
    end
  end

  #slower solution 2
  def primes2(n) do
    2..n |> Enum.filter(&prime2?/1)
  end

  def prime2?(n) do
    cond do
      n < 2          -> false
      n <= 3         -> true
      rem(n, 2) == 0 -> false
      true           -> 3..n-1 |> Enum.all?(&(rem(n, &1) != 0))
    end
  end

  # Exercise: ListsAndRecursion-4
  # Write a function MyList.span(from, to) that returns a list of the numbers from
  # from up to to.
  def span(from, to), do: map(from..to, &(&1))


  # Common utilities

  def map([], _func),do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

end

IO.inspect MyList.primes(10)
IO.inspect MyList.primes2(10)
