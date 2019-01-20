# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  # Hash to store and remove indexs. (index, repeats)
  # Or an array
  entry = Struct.new(:repeats, :index)
  visited = {}
  s.split("").each_with_index do |c, i|
    if e = visited[c]
      e.repeats = true
    else
      visited[c] = entry.new(false, i)
    end
  end

  # Hashes in ruby preserve order so we can just iterate the keys to find the first
  visited.each do |key, value|
    return value.index unless value.repeats
  end
  return -1
end

puts first_uniq_char('leetcode')
