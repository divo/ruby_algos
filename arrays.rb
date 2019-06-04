a1 = Array.new(3, true)
puts a1.inspect
# [true, true, true]
a1.each { |a| print a.object_id.to_s  + " " }
#20 20 20

a2 = Array.new(4) { Hash.new }
puts a2.inspect
#[{}, {}, {}, {}]
a2.each { |a| print a.object_id.to_s  + " " }
#70347403587820 70347403587800 70347403587780 70347403587760

arr = ['a', 'b', 'c', 'd', 'e', 'f']
arr[100] # = nil
arr.fetch(100) # throws IndexError

arr.take(3) # ['a', 'b', 'c']
arr.drop(2) # ['c']
# Array unmodified in both cases

arr.empty? # False, proper way to check for empty array

arr.include?('a') # true, check for element.

# Adding elements
arr = [0, 1, 2, 3]
arr.push(4) # [0, 1, 2, 3, 4]
arr << 4 # Equivelent, append

arr.insert(2, 'test') # [0, 1, 'test', 2, 3, 4]

#Removing elements
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]

# Remove from front
arr.shift #=> 1
arr #=> [2, 3, 4, 5]

# Delete at index
arr.delete_at(2) #=> 4
arr #=> [2, 3, 5]

# Delete an elements
arr = [1, 2, 2, 3]


# Remove nils
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
# compact! to modify in place


# Selecting
[arr = [1, 2, 3, 4, 5]
arr.select { |a| a > 3 } # [4, 5]
arr.reject { |a| a < 3 } # [3, 4, 5]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
# select! and reject! also]

# Intersect
[1, 2, 3] & [3, 4, 5] # [3]

# Repetition
[ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
[1, 2, 3] * "," # "1,2,3" , strings are special case, same as .join(str)

# Concat
[1, 2] + [3, 4] # [1, 2, 3, 4]

# Difference
[ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]  #=>  [ 3, 3, 5 ]

# Push
[ 1, 2 ] << "c" << "d" << [ 3, 4 ] #=>  [ 1, 2, "c", "d", [ 3, 4 ] ]

# Compare
[ "a", "a", "c" ]  <=> [ "a", "b", "c" ]   #=> -1
[ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1
# Arrays compared element by element. First two non equal elements are the result of the compare
# Key thing is here the Arrays are compared by calling <=> on the elements within, so these elemets need to provde <=>

# Abbreviations
require 'abbrev'
%w{ car cone }.abbrev
#=> {"ca" => "car", "con"=>"cone", "co" => "cone", "car"=>"car", "cone" => "cone"}
# Calculte the set of abbreviations for the strings in self

#Collect, see map

# Combinations
a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
# Yields all the combinations of a given length

# Compact
[ "a", nil, "b", nil, "c", nil ].compact #=> [ "a", "b", "c" ]
# Remove all nils, also has compact!

# Count
[1, 2, 3, 4].count # 4
[1, 2, 3, 4].count { |x| x % 2 == 0 } # 2
# If given a block it return the number of elements for which the block return true

# Delete
['a', 'b', 'b', 'b', 'c'].delete('b') # ['a', 'c']
# Deletes all instances of param
# Returns nil OR executes passed block if noting found

# Delete at
['a', 'b', 'c'].delete_at(1) # ['a', 'c']
# Deletes at the passed index

# delete_if
# same as reject!

# dig
a = [[1, [2, 3]]]
a.dig(0, 1, 1) # 3
# Extracts nested values specified by the squence of index values

# drop
a = [1, 2, 3, 4, 5, 0]
a.drop(3) # [4, 5, 0]
# Drops the first n elements in an array and returns remaining

# drop_while
a = [1, 2, 3, 4, 5]
a.drop_while { |i| i < 3 } # [3, 4, 5]
# Drop up to, but not including the first element for which the block returns true

# each
a = [1, 2, 3, 4]
a.each { |x| print "#{x * 10}" } # 10 20 30 40; [1, 2, 3, 4]
# Executes the block for every element, returns the array itself

# empty?
[].empty # true
# Returns true if the array contains no elements

# fetch
a = [1, 2, 3, 4, 5]
a.fetch(1) # 2
a.fetch(200) # Throws
a.fetch(200, 0) # 0
# Get element at index, throw if not found. Second arg is a default value to return.

# fill
a = [1, 2, 3, 4]
a.fill('x') # ['x', 'x', 'x', 'x']
a.fill { |x| x * 2 } # [2, 4, 6, 8]
# Fill the array with arg. Can be given a range or block. Modified in place

# find_index
a = [0, 2, 4, 6, 8, 10]
a.find_index(4) # 2
a.index(4) # 2
# Finds the index of th first item that matches param. Can also be passed a block
# Same as index

# first
a = [1, 2, 3, 4, 5]
a.first # 1
a.first(2) # [1, 2]
# Returns the first element of the array or the first n elements

# flatten
[ 4, 5, 6, [7, 8] ].flatten # [4, 5, 6, 7, 8]
# Return a new one dimensional array
# also has flatten!
# can specify arg for number of levels

# frozen?
# Returns true if the array is forzen

# hash
# Return the hash-code for an array, computed from it's elements

# include?
a = ['a', 'b', 'c']
a.include?("b") # true
# True if any element == arg

# insert
a = %w[a b c d]
a.insert(2, 99) # ["a", "b", 99, "c", "d"]
# Insert the value before the given index

# inspecet
[ "a", "b", "c" ].to_s #=> "[\"a\", \"b\", \"c\"]"
# Create a string representation

# join
['a', 'b', 'c'].join # abc
['a', 'b', 'c'].join('-') # a-b-c
# Converts every element to string and joins them using arg, or "". ($ is used if set)

# keep_if
a = %w{ a b c d e f }
a.keep_if { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
# Delets every element for which the block evaluates to false

# last
[1, 2, 3, 4].last # 4
# Returns the last element, or nil if empty

# length / size
# Returns the number of elements. Cannot be passed a block like 'count'
# Use one of these normally, use 'count' when you want some count logic

# map
a = [ "a", "b", "c", "d" ]
a.map { |x| x + "!" } # ["a!", "b!", "c!", "d!"]
# Invokes the block once for each element, creates a new array containing the returned values
# map! to replace inplace

# pack
# Packs the contents into a binary sequence according to passed directives.
# Has an argument list as long as my arm, forgetaboutit

# permutation
a = [1, 2, 3]
a.permutation.to_a  #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
# yield all permutations of an array
# An ordinal can also be passed

# pop
a = [ "a", "b", "c", "d" ]
a.pop     #=> "d"
a.pop(2)  #=> ["b", "c"]
a         #=> ["a"]
# Removes the last element of an array and returns it.
# Can also be given an number arg. Modifies in place

# product
[1,2,3].product([4,5])  #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
# Returns an array of all combinations of elemements from all arrays

# push
a = [1, 2, 3]
a.push(4) # [1, 2, 3, 4]
# append the element to the array and return the array

# reject and reject!
# Opposite of select. Same as delete_if

# repeated_combinations
a = [1, 2, 3]
a.repeated_combination(2).to_a  #=> [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
# yields all the repeated combinations of array
# with combinations the relative order matters

# repeated_permutations
a = [1, 2]
a.repeated_permutation(1).to_a  #=> [[1], [2]]
a.repeated_permutation(2).to_a  #=> [[1,1],[1,2],[2,1],[2,2]]
# yield all repeated permutations of an array
# with permutations the order does not matter (so this will yeild a much bigger result than combinations)

# replace
# replace the entire contents with arg array

# reverse
%w[a b c].reverse # ['c', 'b', 'a']
# reverse! is also a thing

# reverse_each
[ "a", "b", "c" ].reverse_each {|x| puts x } # cba
# same as 'each' but reversed

# rindex
[ "a", "b", "b", "b", "c" ].rindex("b") #=> 3
# returns the index of the last element

# rotate(count=1)
a = [ "a", "b", "c", "d" ]
a.rotate    #=> ["b", "c", "d", "a"]
a.rotate(2) #=> ["c", "d", "a", "b"]
# Returns a new array so the element at count is at the front
# rotate! is also a thing

# sample
a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a.sample         #=> 7
a.sample(4)      #=>  [6, 4, 2, 5]
# returns a _random_ elements from the array. The same indices is _not_ repeated

# select
[1,2,3,4,5].select { |num|num.even?  }   #=> [2, 4]
# returns a new array of elements for which block evals to true
# select! is also a thing

# shift
a = [1, 2, 3]
a.shift #=> 1; a == [2, 3]
a.shift(2) # [2, 3]; a == []
# Returns the first element of the array and _shifts_ all the others down

# shuffle
[ 1, 2, 3 ].shuffle # [2, 3, 1]
# return new array with all elements shuffled
# shuffle! is also a thing

# size, alas for length

# slice
a = [ "a", "b", "c", "d", "e" ]
a[1, 2] #=> [ "b", "c" ]
a[1..3] #=> [ "b", "c", "d" ]
# can be given [start, length] or a range
# slice! is also a thing

# sort
a = [ "d", "a", "e", "c", "b" ]
a.sort                    #=> ["a", "b", "c", "d", "e"]
a.sort { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]
# sorts the array using <=> on the elements or with the optional block
# sort! is also a thing

# sort_by
[1, 2, 3, 4].sort_by { |x| x } #=> [1, 2, 3, 4]
[1, 2, 3, 4].sort_by { |x| x * -1 } #=> [4, 3, 2, 1]
# sort self in place by using a set of keys generated by mapping self though the given block
# (it sorts the keys returned using <=>
# This is slow so not really useful when keys are trivially compared, is more useful when keys are more complex to compute and sort
# sort_by! is also a thing

# take
a = [1, 2, 3, 4, 5, 0]
a.take(2) # [1, 2]
a == [1, 2, 3, 4, 5, 0]
# Return the first n elements

# take_while
a = [1, 2, 3, 4, 5, 0]
a.take_while { |i| i < 3 }  #=> [1, 2]
# Passes elements to the block until the return nil/false, then all prior elements are returned

# to_h
[[:foo, :bar], [1, 2]].to_h # => {:foo => :bar, 1 => 2}
# Returns ary interpolated as a set of key/value pairs.
# Array must be in this form or it will throw

# transpose
a = [[1,2], [3,4], [5,6]]
a.transpose   #=> [[1, 3, 5], [2, 4, 6]]
# Assumes array is array of arrays and swaps the cols/rows
# Array must be square

# uniq
a = [ "a", "a", "b", "b", "c" ]
a.uniq   # => ["a", "b", "c"]
# returns new array with duplicates removed. Uses the elements hash method .eql?
# uniq! also exists

# unshift
a = [ "b", "c", "d" ]
a.unshift("a")   #=> ["a", "b", "c", "d"]
# Prepend the objects to the array, moving the other elements _upwards_

# values_at
a = %w{ a b c d e f }
a.values_at(1, 3, 5)          # => ["b", "d", "f"]
a.values_at(4..6, 3...6)      # => ["e", "f", nil, "d", "e", "f"]
# Returns an array of values given by the selectors

# zip
['a', 'b', 'c'].zip([1, 2], [8]) # [["a", 1, 8], ["b", 2, nil], ["c", nil, nil]]
# Merge self with corrisponding elements of arg arrays (Arguments are converted to arrays)

# union
[ "a", "b", "c" ] | [ "c", "d", "a" ]    #=> [ "a", "b", "c", "d" ]
# Set union, return new array that is union of the two



















































