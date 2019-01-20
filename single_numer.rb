def single_number(nums)
  # But the number in a map the first time seen
  # remove it the second
  visited = {}
  nums.each do |x|
    if visited[x].nil? 
      visited[x] = 1
    else
      visited.delete(x) # This is ok beacuse the only appear max twice
    end
  end
  visited.keys.first
end
