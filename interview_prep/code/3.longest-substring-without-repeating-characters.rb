# @param {String} s
# @return {Integer}
# Input: s = "abcabcbb"
# "bbbbb"
# Use a hash to keep track of counts and a sliding window to move through the array
# Move right while we can still add letters
# Move left when we exceed the limit, keep going until we have no repeating chars
# Return when right reaches the end
def length_of_longest_substring(s)
  counts = Hash.new(0)
  left = 0
  result = 0
  count = 0
  s.chars.each do |right|
    counts[right] += 1
    count += 1
    if counts[right] <= 1
      result = [count, result].max
    else
      while counts[right] > 1
        counts[s.chars[left]] -= 1
        count -= 1
        left += 1
      end
    end
  end
  result
end

