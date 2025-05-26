# @param {String[]} words
# @return {Integer}
# ["lc","cl","gg"]
def longest_palindrome(words)
  visited = Array.new(words.length)
  result = 0
  words.each_with_index do |val_i, idx_i|
    #words[(idx_i + 1)...].each_with_index do |val_j, idx_j|
    #  next if visited[idx_i] || visited[idx_j + idx_i]

    words[idx_i.next..].each_with_index do |val_j, idx_j|
      next if visited[idx_i] || visited[idx_i.next + idx_j]

      if val_i == val_j.reverse
        result += 4
        visited[idx_i] = true
        visited[idx_j + idx_i.next] = true
      end
    end
  end

  words.each_with_index do |val, idx|
    next if visited[idx]

    if val == val.reverse
      result += 2 
      break
    end
  end
    
  result
end
