# @param {Integer[]} fruits
# @return {Integer}
# [1, 2, 3, 2, 2]
# max: 1
# left: 1
# right: 1
# uniqs: [2]
def total_fruit(fruits)
  window_start = 0
  max_length = 0
  fruit_frequency = {}

  # try to extend the range [window_start, window_end]
  fruits.each_with_index do |right_fruit, window_end|
    fruit_frequency[right_fruit] ||= 0
    fruit_frequency[right_fruit] += 1

    # shrink the sliding window, until we are left with '2' fruits in the fruit
    # frequency dictionary
    while fruit_frequency.keys.size > 2
      left_fruit = fruits[window_start]
      fruit_frequency[left_fruit] -= 1
      fruit_frequency.delete(left_fruit) if fruit_frequency[left_fruit] == 0
      window_start += 1  # shrink the window
    end
    max_length = [max_length, window_end - window_start + 1].max
  end

  max_length
end


# [1, 2, 3, 2, 1]
def total_fruit_n_pow_2?(fruits)
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

