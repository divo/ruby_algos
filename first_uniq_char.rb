# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  # Hash to store and remove indexs. (index, repeats)
  # Or an array
  entry = Struct.new(:repeats, :index)
  visited = {}
  s.split("").each_with_index do |c, i| 
    if visited[c].nil?
      visited[c] = entry.new(false, i)
    else
      e = visited[c]
      e.repeats = true
      visited[c] = e
    end
  end
  
  # Hashes in ruby preserve order so we can just iterate the keys to find the first
  visited.keys.each do |key|
    unless visited[key].repeats
      return visited[key].index
    end
  end
  return -1
end
