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
arr[100] # throws IndexError

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
arr.delete(2) #=> [1, 3]

# Remove nils
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
# compact! to modify in place


# Selecting
arr = [1, 2, 3, 4, 5]
arr.select { |a| a > 3 } # [4, 5]
arr.reject { |a| a < 3 } # [3, 4, 5]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
# select! and reject! also

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
[ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1
[ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1
# Arrays compared element by element. First two non equal elements are the result of the compare
# Key thing is here the Arrays are compared by calling <=> on the elements within, so these elemets need to provde <=>

# Abbreviations
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





















