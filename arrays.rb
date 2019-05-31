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
































































