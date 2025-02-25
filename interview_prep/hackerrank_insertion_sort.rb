def insertionSort1(n, arr)
  # Write your code here
  i = arr.length - 1
  x = arr.last

  while i > 0 && x < arr[i - 1]
    arr[i] = arr[i - 1]
    puts arr.join(' ')
    i -= 1
  end

  arr[i] = x
  puts arr.join(' ')
end

def insertion_sort1(arr)
  i = arr.length - 1
  x = arr[i]

  while i > 0 && arr[i - 1] > x
    arr[i] = arr[i - 1]
    puts arr.join(" ")
    i -= 1
  end

  arr[i] = x
  puts arr.join(" ")

end

insertionSort1(10, [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
puts ''
insertion_sort1([2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
