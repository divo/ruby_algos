def first_bad_version(n)
  left = 0
  right = n - 1
  while left <= right
    mid = (left + right) / 2
    if !is_bad_version(mid)
      left = mid + 1
    else
      right = mid - 1
    end
  end
  return left
end

def is_bad_version(n)
  return n >= 4
end

puts first_bad_version(5)
