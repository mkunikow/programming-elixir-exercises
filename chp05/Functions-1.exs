#Exercise: Functions-1
#Go into iex. Create and run the functions that do the following:
#– list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
#– sum.(1, 2, 3) #=> 6
#– pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]


list_concat_a = fn a,b -> a ++ b end
sum_a = fn a,b,c -> a + b + c end
pair_tuple_to_list_a = fn {t1, t2} -> [t1, t2] end

list_concat_a.([:a,:b], [:c, :d])
sum_a.(1,3)
pair_tuple_to_list_a.({:a, :b})
