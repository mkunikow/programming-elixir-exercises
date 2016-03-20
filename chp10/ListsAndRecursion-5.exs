defmodule MyEnum do
  # Exercise: ListsAndRecursion-5
  # Implement the following Enum functions using no library functions or list
  # comprehensions: all?, each, filter, split, and take.
  # You may need to use an if statement to implement filter. The syntax for this is
  # if condition do
  # expression(s)
  # else
  # expression(s)
  # end

  # def all?(enumerable, fun \\ fn x -> x end) do
  def all?([], _fun), do: true
  def all?([head | tail], fun) do
    result = fun.(head)
    if not result do
      result
    else
      MyEnum.all?(tail, fun)
    end
  end

  def each([], _fun), do: nil
  def each([head | tail], fun) do
    fun.(head)
    MyEnum.each(tail, fun)
  end

  def filter([], _fun), do: []
  def filter([head | tail], fun) do
    if fun.(head) do
        [head | MyEnum.filter(tail, fun)]
      else
        MyEnum.filter(tail, fun)
    end
  end

  def split(list, count), do: _split(list, count, 0, [], [])


  defp _split([], _count, _counter, left, right), do: {reverse(left), reverse(right)}

  defp _split([head | tail], count, counter, left, right) when counter < count do
      _split(tail, count, counter + 1, [head | left], right)
  end

  defp _split([head | tail], count, counter, left, right) when counter >= count do
      _split(tail, count, counter + 1, left, [head | right])
  end

  def split2(list, 0), do: {[], list}
  def split2([], _count), do: {[], []}

  def split2([head | tail], count) do
     {left, right} = split2(tail, count-1)
     {[head | left], right}
  end

  def take([], _count), do: []
  def take(_list, 0), do: []
  def take([head | tail], count), do: [head | take(tail, count - 1)]


  def reverse([]), do: []
  def reverse([head | tail]), do: reverse(tail) ++ [head]





end

# IO.puts MyEnum.all? [-1, 1, 2, 3], &(&1 > 0)
# MyEnum.each(["some", "example"], fn(x) -> IO.puts x end)
 (MyEnum.filter([1,2,3,4], fn(x) -> x > 2 end) == [3,4]) or raise("filter([1,2,3,4], fn(x) -> x > 2 end) != [3,4]")
