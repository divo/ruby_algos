# @param {Integer[][]} is_connected
# @return {Integer}
# Walk the graph looking for 1s and tracking which nodes you have visited
# If you find 1 that has not been visited, search for reachable nodes and visit all of them
# Count the number of times you search
# Searching: Step in each direction and mark any 1s as visited
# c = 1
# [1,1,0]
# [1,1,0]
# [0,0,1]
# [true, true, false]
# [true, true, false]
# [false, false, false]
def find_circle_num(is_connected)
  len = is_connected.length
  connected = Hash.new { |h, k| h[k] = [] }
  len.times do |i|
    len.times do |j|
      connected[i] << j if is_connected[i][j] == 1
    end
  end
  pp connected
  isolated = connected.values.count { |cons| cons.length == 1 }
  isolated += 1 unless connected.values.all? { |cons| cons.length == 1 }
  isolated
end

def find_circle_num_incorrect(is_connected)
  len = is_connected.length
  count = 0
  @visited = Array.new(len) { Array.new(len) { false } }
  len.times do |i|
    len.times do |j|
      if is_connected[i][j] == 1 && !@visited[i][i]
        count += 1
        search(is_connected, i, j)
      end
    end
  end

  count
end

def search(is_connected, i, j)
  return if i < 0 || i >= is_connected.length || j < 0 || j >= is_connected.length

  return if is_connected[i][j] != 1

  return if @visited[i][j]

  @visited[i][j] = true
  search(is_connected, i + 1, j)
  search(is_connected, i - 1, j)
  search(is_connected, i, j + 1)
  search(is_connected, i, j - 1)
end
