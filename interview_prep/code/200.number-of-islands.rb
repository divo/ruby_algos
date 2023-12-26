# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  visited = Array.new(grid.length) { Array.new(grid.first.length) { false } }
  result = 0

  grid.each_with_index do |row, row_idx|
    row.each_with_index do |val, col_idx|
      if val == "1" && !visited[row_idx][col_idx]
        search_island(row_idx, col_idx, grid, visited)
        result += 1
      end
    end
  end

  result
end

def search_island(row, col, grid, visited)
  return unless grid[row][col] == "1" && !visited[row][col]

  visited[row][col] = true
  search_island(row + 1, col, grid, visited) if row + 1 < grid.length
  search_island(row - 1, col, grid, visited) if row - 1 >= 0
  search_island(row, col + 1, grid, visited) if col + 1 < grid[row].length
  search_island(row, col - 1, grid, visited) if col - 1 >= 0
end
