defmodule MyString do
  def anagram?(w1, w2), do: Enum.sort(w1) == Enum.sort(w2)
end

IO.inspect MyString.anagram?('abc', 'cba')
IO.inspect MyString.anagram?('abc', 'cca')
