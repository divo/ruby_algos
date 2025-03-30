def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr[arr.length / 2] # Choose middle element as pivot
  left = []
  right = []

  arr.each do |x|
    if x < pivot
      left << x
    elsif x > pivot
      right << x
    end
    # Equal elements are ignored here, but can be handled if necessary
  end

  quicksort(left) + [pivot] + quicksort(right)
end

# Example usage:
arr = [5, 3, 8, 6, 2, 7, 4, 1]
sorted_arr = quicksort(arr)
puts sorted_arr.inspect
