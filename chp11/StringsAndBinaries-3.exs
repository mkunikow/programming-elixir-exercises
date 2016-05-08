# Try the following in iex:
# iex> [ 'cat' | 'dog' ]
# ['cat',100,111,103]
# Why does iex print 'cat' as a string, but 'dog' as individual numbers?

# https://forums.pragprog.com/forums/322/topics/Exercise:%20StringsAndBinaries-3
# Because the head of the new list is actually the list [?c, ?a, ?t].
# This means the overall list consists of a list and three ASCII
# characters:
#
#   [ 'cat' | 'dog' ] = [ [ ?c, ?a, ?t ], ?d, ?o, ?g ]
#
# Because the overall list contains something other than ASCII
# characters, it is displayed as a list of values. But the first value is
# the list 'cat', which _is_ just ASCII characters.
