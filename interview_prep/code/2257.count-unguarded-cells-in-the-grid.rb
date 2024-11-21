# Example 1:
# Input: m = 4, n = 6, guards = [[0,0],[1,1],[2,3]], walls = [[0,1],[2,2],[1,4]]
# Output: 7
# Explanation: The guarded and unguarded cells are shown in red and green respectively in the above diagram.
# There are a total of 7 unguarded cells, so we return 7.
#
# Example 2:
# Input: m = 3, n = 3, guards = [[1,1]], walls = [[0,1],[1,0],[2,1],[1,2]]
# Output: 4
# Explanation: The unguarded cells are shown in green in the above diagram.
# There are a total of 4 unguarded cells, so we return 4.
#	All the positions in guards and walls are unique.

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} guards
# @param {Integer[][]} walls
# @return {Integer}
def count_unguarded(m, n, guards, walls)
  grid = Array.new(m) { Array.new(n) }
  grid = populate_grid(grid, guards, :guard)
  grid = populate_grid(grid, walls, :wall)

  # Iterate over the entire grid
  m.times do |i|
    n.times do |j|
      next unless grid[i][j] == :guard

      mark_cells(i - 1, j, :up, grid)
      mark_cells(i + 1, j, :down, grid)
      mark_cells(i, j - 1, :left, grid)
      mark_cells(i, j + 1, :right, grid)
    end
  end

  grid.flatten.count(&:nil?)
end

def populate_grid(grid, positions, symbol)
  positions.each do |i, j|
    grid[i][j] = symbol
  end

  grid
end

def mark_cells(i, j, direction, grid)
  return if i < 0 || i >= grid.length || j < 0 || j >= grid.first.length

  return if grid[i][j] == :wall || grid[i][j] == :guard

  grid[i][j] = :guarded

  case direction
  when :up
    mark_cells(i - 1, j, direction, grid)
  when :down
    mark_cells(i + 1, j, direction, grid)
  when :left
    mark_cells(i, j - 1, direction, grid)
  when :right
    mark_cells(i, j + 1, direction, grid)
  end
end
