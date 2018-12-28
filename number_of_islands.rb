# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  result = 0
  visited = Array.new()
  
  grid.each_with_index { |row, i| 
    row.each_with_index { |val, j|
      if check(grid, visited, i, j)
        result += 1
        visit_children(grid, visited, i, j)
      end
    } 
  }
  result
end

def visit_children(grid, visited, x, y)
  if check(grid, visited, x - 1, y)
    visit_children(grid, visited, x - 1, y)
  end
  if check(grid, visited, x, y - 1)
    visit_children(grid, visited, x, y - 1)
  end
  if check(grid, visited, x + 1, y)
    visit_children(grid, visited, x + 1, y)
  end
  if check(grid, visited, x, y + 1)
    visit_children(grid, visited, x, y + 1)
  end
end  
  
def check(grid, visited, x, y)
  if x < 0 || x > grid.length
    return false
  end
  
  if visited[x] == nil 
    visited[x] = Array.new()
  end

  if grid[x] == nil
    return false
  end
  
  if (visited[x][y] == nil && grid[x][y] == "1")
    visited[x][y] = true
    return true
  else 
    visited[x][y] = true
    return false
  end
end
