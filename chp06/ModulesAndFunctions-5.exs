#Exercise: ModulesAndFunctions-5
#Write a function gcd(x,y) that finds the greatest common divisor between
#two nonnegative integers. Algebraically, gcd(x,y) is x if y is zero; it’s gcd(y,
#rem(x,y)) otherwise.

defmodule Math do
  def gdc(a, 0), do: abs(a)
  def gdc(a, b), do: gdc(b, rem(a,b))
end
