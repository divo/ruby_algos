# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  # Need to find the largest area, given by the height of two elements and the distance between them
  # x = idx_a - idx_b
  # y = [idx_a, idx_b].min
  # area = x * y
  # It makes sense to start from either end of the array to maximize x
  # Then move left or right depending on which of the two is smaller
  left, right = 0, height.length - 1
  max = 0
  while left < right
    x = right - left
    y = [height[left], height[right]].min
    area = x * y
    max = [max, area].max

    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max
end

max_area([1,8,6,2,5,4,8,3,7])
