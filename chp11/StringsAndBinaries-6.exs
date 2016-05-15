# Write a function to capitalize the sentences in a string. Each sentence is
# terminated by a period and a space. Right now, the case of the characters
# in the string is random.

# iex> capitalize_sentences("oh. a DOG. woof. ")
# "Oh. A dog. Woof. "

# String.graphemes("A to") |> Enum.map(&String.downcase/1) |> Enum.reduce("", fn(x, acc) -> acc <> x end)

defmodule MyString do

  def capitalize_sentences(s) do
    String.split(s, ". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end

end

IO.inspect MyString.capitalize_sentences("oh. a Dog. woof. ")


