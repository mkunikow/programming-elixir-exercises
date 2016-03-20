#Exercise: Functions-3
#The operator rem(a, b) returns the remainder after dividing a by b. Write a
#function that takes a single integer (n) and calls the function in the previ-
#ous exercise, passing it rem(n,3), rem(n,5) , and n. Call it seven times with
#the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13,
#14, FizzBuzz, 16.”



fizbuzz = fn
  0, _, _  -> "Fizz"
  _, 0, _  -> "Buzz"
  _, _, a3 ->  a3
  end

fizbuzzrun = fn a1 -> fizbuzz.(rem(a1, 3), rem(a1, 5), a1) end

fizbuzzrun.(10)
fizbuzzrun.(11)
fizbuzzrun.(12)
