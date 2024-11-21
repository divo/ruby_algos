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
  guarded = []

  mark_cells = lambda { |i, j, direction|
    return if i < 0 || i >= m || j < 0 || j >= n

    return if guards.include?([i, j]) || walls.include?([i, j])

    guarded << [i, j] unless guarded.include?([i, j])

    case direction
    when :up
      mark_cells.call(i - 1, j, direction)
    when :down
      mark_cells.call(i + 1, j, direction)
    when :left
      mark_cells.call(i, j - 1, direction)
    when :right
      mark_cells.call(i, j + 1, direction)
    end
  }

  # Iterate over the entire grid
  m.times do |i|
    n.times do |j|
      next unless guards.include?([i, j])

      mark_cells.call(i - 1, j, :up)
      mark_cells.call(i + 1, j, :down)
      mark_cells.call(i, j - 1, :left)
      mark_cells.call(i, j + 1, :right)
    end
  end

  (m * n) - guarded.length - guards.length - walls.length
end

# puts count_unguarded(4, 6, [[0, 0], [1, 1], [2, 3]], [[0, 1], [2, 2], [1, 4]])
