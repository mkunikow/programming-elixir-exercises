#Exercise: ModulesAndFunctions-1
#Extend the Times module with a triple function that multiplies its parameter
#by three.

#Exercise: ModulesAndFunctions-3
#Add a quadruple function. (Maybe it could call the double function....)


defmodule Times do
  def double(n), do: n*2
  def triple(n), do: n*3
  def quadruple(n), do: n*4
end
