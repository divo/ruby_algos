# @param {Integer[][]} move_time
# @return {Integer}
# Looks like Shortest Path problem
# First need to build the input into a graph
# Could maybe build a grid of times and greedy take the next best move, but that would involve backtracking
# Use shortest path
# 1. Build an adjacency list we can use as a graph
# 2. See if I can remember how to implement Djisktras
# Or just implement Dijkstra but use the grid instead of an adjaceny list? move_time is an adjacency list of sorts. Can probably ditch the visited check?
def min_time_to_reach(move_time)
  heap = Containers::Heap.new()
  visited = Array.new(move_time.length) { Array.new(move_time.first.length) { false } }
  total_cost = 0
  heap.push(0, [0, 0])
  until heap.empty?
    cost, (x, y) = heap.next_key, heap.pop
    if cost > total_cost
      total_cost += cost - total_cost
    else
      total_cost += 1
    end

    return total_cost if x == move_time.length - 1 && y == move_time.first.length - 1

    visited[x][y] = true
    pp "#{x}, #{y}, #{cost}, #{total_cost}"
    # Take the cost of the node in each direction we can go
    heap.push(move_time[x + 1][y], [x + 1,  y]) if legal_move(x + 1, y, move_time, visited)
    heap.push(move_time[x][y + 1], [x, y + 1]) if legal_move(x, y + 1, move_time, visited)
    heap.push(move_time[x - 1][y], [x - 1,  y]) if legal_move(x - 1, y, move_time, visited)
    heap.push(move_time[x][y - 1], [x, y - 1]) if legal_move(x, y - 1, move_time, visited)
  end
    
  total_cost
end

def legal_move(x, y, move_time, visited)
  # Fixme: May confuse x and y
  return false if x < 0 || x >= move_time.length
  return false if y < 0 || y >= move_time.first.length
  return false if visited[x][y]

  true
end
