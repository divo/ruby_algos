# @param {Integer[]} fruits
# @return {Integer}
# [1, 2, 3, 2, 2]
# max: 3
# start: 1
# end: 3
# uniqs: [2, 3, 2]
def total_fruit(fruits)
  longest_subset(2, fruits)
end

def longest_subset(k, set)
  max, window_start = 0, 0
  uniq = Hash.new(0)
  set.each_with_index do |char, window_end|
    uniq[char] += 1
    # Slide the start of the window
    # NOTE: We don't need a seperate conditional for the uniq key size, the
    # loop on it's own is fine
    while uniq.keys.count > k
      start_char = set[window_start]
      uniq[start_char] -= 1
      uniq.delete(start_char) if uniq[start_char] <= 0
      window_start += 1
    end

    max = [max, window_end - window_start + 1].max
  end
  max
end


# [1, 2, 3, 2, 1]
# This is worse because we don't iterate along the array in linear time,
# we extend and reduce the end of the window multiple times per char
# In the above we move the start of the window less (much less??)
def total_fruit_first_attempt(fruits)
  # Count the max number of nums I can take from each array
  # with only two possible values, moving left to right while taking a number
  # Start from anywhere in the array
  max, left, right = 0, 0, 0
  uniqs = {}
  while right < fruits.length do
    uniqs[fruits[right]] = true
    if uniqs.keys.count <= 2
      count = right - left + 1
      max = count if max < count
      right += 1
    else
      uniqs = {}
      left += 1
      right = left
    end
  end
  max
end

