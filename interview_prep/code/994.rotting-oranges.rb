# @param {Integer[][]} grid
# @return {Integer}
# 14/03/25
# I tried and failed to do this quesitons again, going down a wrong path
# Dissapointing considering I got this question with no issue over a YEAR AGO
def oranges_rotting(grid)
  # Count the number of steps needed to rot all the rotten fruits neighbours
  # Walk the grid and rot all the rotten fruits neighbours
  # Stop when there is nothing left to rot, or we have an isolated subregion

  count = count_rotten(grid)
  result = 0
  loop do
    rot_grid(grid)
    # Stop if there is nothing left to rot
    new_count = count_rotten(grid)
    break if new_count == count

    count = new_count
    result += 1
  end

  # Check if there is any fruit that was not able to rot
  return -1 if grid.flatten.any?(1)

  result
end

def count_rotten(grid)
  grid.flatten.count(2)
end

def rot_grid(grid)
  # Walk the grid and rot anything that has a rotten neighbout
  nodes_to_rot = []
  grid.each_with_index do |row, i|
    row.each_with_index do |val, j|
      nodes_to_rot << [i, j] if val == 2
    end
  end

  nodes_to_rot.each { |row, col| rot_neighbors(grid, row, col) }
end

def rot_neighbors(grid, row, col)
  rot(grid, row + 1, col)
  rot(grid, row - 1, col)
  rot(grid, row, col + 1)
  rot(grid, row, col - 1)
end

def rot(grid, row, col)
  return if row < 0 || row >= grid.length || col < 0 || col >= grid.first.length

  return unless grid[row][col] == 1

  grid[row][col] = 2
end

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
      rotten << [i, j] if val == 2
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
