# You are given a 2D integer array items where items[i] = [pricei, beautyi] denotes the price and beauty of an item respectively.
# Input: items = [[1,2],[3,2],[2,4],[5,6],[3,5]], queries = [1,2,3,4,5,6]
# Output: [2,4,5,5,6,6]
# Input: items = [[1,2],[1,2],[1,3],[1,4]], queries = [1]
# Output: [4]
# Example 3:
# Input: items = [[10,1000]], queries = [5]
# Output: [0]
# Constraints:
# 	1 <= items.length, queries.length <= 10⁵
# 	items[i].length == 2
# 	1 <= pricei, beautyi, queries[j] <= 10⁹
#
#
#
# @param {Integer[][]} items
# @param {Integer[]} queries
# @return {Integer[]}
def maximum_beauty(items, queries)
  # Find the highes beauty for each price
  highest_beauty_items =
    items.group_by { |price, _beauty| price }
         .map { |_price, beauty_list| beauty_list.max }

  # Find the most beauty each price can afford
  max_beauty = Hash.new { 0 }
  highest_beauty_items.each do |price, beauty|
    max_beauty[price] = beauty if max_beauty[price] < beauty
  end

  # Fill in any missing prices
  prev_max =
    if queries.min < max_beauty.min_by { |price, _beauty| price }.first
      0
    else
      max_beauty.min_by { |price, _beauty| price }.last
    end

  # prev_max = max_beauty.min_by { |price, _beauty| price }
  # prev_max = max_beauty[queries.min]

  queries.sort.each do |n|
    if max_beauty[n] == 0
      max_beauty[n] = prev_max
    else
      prev_max = max_beauty[n]
    end
  end

  # Lookup the max beauty for each price
  queries.map do |price|
    max_beauty[price]
  end
end

# puts maximum_beauty([[1, 2], [3, 2], [2, 4], [5, 6], [3, 5]], [1, 2, 3, 4, 5, 6])
