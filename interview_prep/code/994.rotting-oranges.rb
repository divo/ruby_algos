# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  ticks = 0
  fresh_count = count_fresh(grid)

  loop do
    return ticks if fresh_count.zero?

    rot_grid(grid)
    new_count = count_fresh(grid)

    return -1 if new_count == fresh_count

    fresh_count = new_count
    ticks += 1
  end
end

def count_fresh(grid)
  grid.flatten.count { |x| x == 1 }
end

def rot_grid(grid)
  rotten = []
  grid.each_with_index do |row, i|
    row.each_with_index do |val, j|
      if val == 2
        rotten << [i, j]
      end
    end
  end

  rotten.each do |i, j|
    rot_fruit(grid, i + 1, j)
    rot_fruit(grid, i - 1, j)
    rot_fruit(grid, i, j + 1)
    rot_fruit(grid, i, j - 1)
  end
end

def rot_fruit(grid, i, j)
  return unless (0 <= i && i < grid.length) && (0 <= j && j < grid[i].length)

  grid[i][j] = 2 if grid[i][j] == 1
end
