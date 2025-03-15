# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
  # Walk the grid and see if there is a way to both oceans from each tile
  # Need to build a path of steps we can take and then at the end check if that path leads to both oceans
  result = []
  heights.each_with_index do |row, i|
    row.each_with_index do |_col, j|
      result << [i, j] if has_path(heights, i, j)
    end
  end

  result
end

def has_path(heights, i, j)
  # Build a path following the rules of water flow
  path = build_path(heights, i, j)
  # Check if that path reaches both oceans
  puts "Path for [#{i}, #{j}]"
  pp path
end

# BFS a path follwing the rules of water flow
def build_path(heights, i, j)
  path = []
  queue = [[i, j]]
  visited = [[false] * heights.first.length] * heights.length

  until queue.empty?
    row, col = queue.shift
    path << [row, col]
    queue.unshift([row + 1, col]) if valid_step(heights, heights[row][col], row + 1, col, visited)
    queue.unshift([row - 1, col]) if valid_step(heights, heights[row][col], row - 1, col, visited)
    queue.unshift([row, col + 1]) if valid_step(heights, heights[row][col], row, col + 1, visited)
    queue.unshift([row, col - 1]) if valid_step(heights, heights[row][col], row, col - 1, visited)
  end

  path
end

def valid_step(heights, val, row, col, visited)
  puts "0 3 #{val} #{visited[row][col]}" if row == 0 && col == 3
  # TODO: We can also stop if we each the 2 corners where the oceans meet. Not sure if thats needed
  return false if row < 0 || row >= heights.length || col < 0 || col >= heights.first.length

  return false if visited[row][col]

  if val >= heights[row][col]
    visited[row][col] = true
    true
  else
    false
  end
end
