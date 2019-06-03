# To implement enumerable for a class, simply provide an each that
# yields successive members of the collection. You must also provide <=>
# if using #min #max #sort

class EnumLike
  include Enumerable
  def each(&block)
    (0..10).each(&block)
  end

  def each_alternative
    (0..10).each { |x| yield x }
  end
end

enum = EnumLike.new()
enum.each { |x| puts x }

# all?
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
# Returns true if the given block never returns false/nil
# If not passed a block { |obj| obj } is used

# any?
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
# Returns true of the given block ever returns something other than false/nil
# If no block passed same behaviour as all?

# chunk
[3, 1, 4, 1, 5, 9].chunk { |n| n.even? }.to_a # [[false, [3, 1]], [true, [4]], [false, [1, 5, 9]]]
# Chunk the element based on the return value of the block.
# Consecuative elements that return the same block value are chunke together.
# Looks fairly powerful but I don't have time to get into it.

# chunk_while { |elt_before, elt_after| bool }
a = [1,2,4,9,10,11,12,15,16,19,20,21]
b = a.chunk_while {|i, j| i+1 == j }
p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
# Create chunks based on adjacent elements
# Again, don't fully appreciate this one.

# collect
# same as map
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
# runs the block once for every element and returns the results as an array

# collect_concat
# same as flat_map
[[1, 2], [3, 4]].flat_map { |e| e + [100] } #=> [1, 2, 100, 3, 4, 100]
# Returns a new array with the concatenated results of running block once for every element.

# count
# can be given an element to count or a block
ary = [1, 2, 4, 2]
ary.count               #=> 4
ary.count(2)            #=> 2
ary.count{ |x| x%2==0 } #=> 3

# cycle
a = ["a", "b", "c"]
a.cycle { |x| puts x }  # print, a, b, c, a, b, c,.. forever.
a.cycle(2) { |x| puts x }  # print, a, b, c, a, b, c.
# Calls block for each element of enum n times, or forever if no arg supplied

# detect, same as find

# each_cons
[1, 2, 3, 4].each_cons(2) { |x| print x } # [1, 2][2, 3][3, 4] => nil
# Iterates the block for each array on consecuive n elements

# each_entry
# calls block ince of each element in self. If each passes multiple args they are converted to an array

# each_slice
[1, 2, 3, 4].each_slice(2) { |x| print x } #[1, 2][3, 4]=> nil
# Iterates over the block for each slice on n elments

# each_with_index
# call the block with two args, item and index

# each_with_object
(1..10).each_with_object([]) { |i, a| a << i*2 } #=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
# Iterates ov the block for each element an a arbitrary object, and _returns_ the initally given object.

# entries
# returns an array containing the items in enum. Doesn't really seem to be any different than to_a, other than it's owned by this module.

# find
(1..100).find    { |i| i % 5 == 0 and i % 7 == 0 }   #=> 35
# Passes each entry of enum to block, returns the first element for which the block does not return false.

# find_all
(1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# Returns an array containing all the elements for which the block returns true

# find_index
# As for find but returns the elements index

# first, as per array notes

# grep
(1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]
# Returns an array of every element for which Pattern === element.

# grep_v
# Inverted version of grep, Pattern !== element

# group_by
(1..6).group_by { |i| i%3 }   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
# Retruns a hash where the keys result form the block. Groups elements with the same keys

# include?
(1..7).include? 6 #=> true
# Returns true if any element == arg

# inject
# Combine all the elements by applying a binary operation.
(5..10).inject { |sum, n| sum + n }            #=> 45
# If block is specified the block is passed an accumulator (memo) and the element.
(5..10).reduce(1, :*)                          #=> 151200
# If symbol passed each element element will be passed to that method on memo
(5..10).reduce(:+)                             #=> 45
# If you do not specifiy an inital value for memo the the first element of the collection is used

# lazy
# Returns a lazy enumerator whos various methods only evaluate values on an as-needed basis.
# Something I need to look back over, probably useful in Ruby with nested enumerators

# map
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
# returns a new array with the results of running block for every element



















