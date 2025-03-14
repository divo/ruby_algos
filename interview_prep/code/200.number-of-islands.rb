# @param {Character[][]} grid
# @return {Integer}
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  result = 0
  grid.each_with_index do |row, i| # Walk the column
    row.each_with_index do |val, j| # Walk the row
      if val == '1'
        result += 1
        visit(i, j, grid)
      end
    end
  end
  result
end

# Search adjacent nodes and mark as visited
def visit(row, col, grid)
  return if row < 0 || row >= grid.length || col < 0 || col >= grid.first.length

  return unless grid[row][col] == '1'

  grid[row][col] = 2
  visit(row + 1, col, grid)
  visit(row - 1, col, grid)
  visit(row, col + 1, grid)
  visit(row, col - 1, grid)
end

def num_islands(grid)
  visited = Array.new(grid.length) { Array.new(grid.first.length) { false } }
  result = 0

  grid.each_with_index do |row, row_idx|
    row.each_with_index do |val, col_idx|
      if val == '1' && !visited[row_idx][col_idx]
        search_island(row_idx, col_idx, grid, visited)
        result += 1
      end
    end
  end

  result
end

def search_island(row, col, grid, visited)
  return unless grid[row][col] == '1' && !visited[row][col]

  visited[row][col] = true
  search_island(row + 1, col, grid, visited) if row + 1 < grid.length
  search_island(row - 1, col, grid, visited) if row - 1 >= 0
  search_island(row, col + 1, grid, visited) if col + 1 < grid[row].length
  search_island(row, col - 1, grid, visited) if col - 1 >= 0
end
