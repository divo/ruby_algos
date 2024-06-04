# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  # First find the row the integer could be in
  row = find_row(matrix, target)
  b_search(matrix[row], target) != -1
end

# Return the row the target could be in, given an ordered matrix
def find_row(matrix, target)
  rows = matrix.collect { |r| r.first }
  left, right = 0, rows.length - 1
  pivot = (right + left) / 2
  while left < right
    if rows[pivot] > target
      right = pivot - 1
      pivot = (right + left) / 2
    elsif rows[pivot] < target
      return pivot if rows[pivot + 1] > target

      left = pivot + 1
      pivot = (right + left) / 2
    else
      return pivot
    end
  end

  pivot
end

def b_search(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    pivot = (right + left) / 2
    if nums[pivot] > target
      right = pivot - 1
    elsif nums[pivot] < target
      left = pivot + 1
    else
      return pivot
    end
  end

  -1
end

