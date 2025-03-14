# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(_grid)
  # @param {Integer[][]} grid
  # @return {Integer}
  def max_area_of_island(grid)
    # Walk the grid and search when we reach an island
    result = 0
    grid.each_with_index do |row, i|
      row.each_with_index do |val, j|
        result = [result, search(i, j, grid)].max if val == 1
      end
    end

    result
  end

  def search(start_row, start_col, grid)
    size = 0
    queue = [[start_row, start_col]]
    until queue.empty?
      row, col = queue.shift

      next if row < 0 || row >= grid.length || col < 0 || col >= grid.first.length

      next unless grid[row][col] == 1

      size += 1
      grid[row][col] = 2

      queue.unshift([row + 1, col])
      queue.unshift([row - 1, col])
      queue.unshift([row, col + 1])
      queue.unshift([row, col - 1])
    end

    size
  end
end
