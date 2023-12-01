# @param {Integer[][]} mat
# @return {Integer[][]}
#
# Spent like 1 hours writing out the brute force solution to this. It's N^3 but I thought I would 
# get away with it given the size of the input set. Guess not.
# It was very fiddly to write and I made a lot of shitty little errors. To my credit
# I'm moshed in and it's less than a desirable way to work
# 
# Lessons:
# 1. _Smallest Distance_ in the problem description probably means BFS
#
# Solution:
# USe BFS out from the 0 Cells. Not really sure I get it, but it's N^2
def update_matrix(mat)
  # For each call, pass it to a nearest methods
  # Nearest takes an index [x, y] for the cell of concern, and a result array
  # nearest uses a queue to check all the neighbours
  # Can it stop when it finds the first result? Or do I need to consider all each
  # iterations neighbours?
  result = Array.new(mat.size) { Array.new(mat.first.size) { mat.size } }
  mat.each_with_index do |row_values, row|
    row_values.each_with_index do |_, col|
      nearest(mat, row, col, result)
    end
  end

  result
end

def nearest(mat, row, col, result)
  queue = [[row, col, row, col, 0]]
  visited = Array.new(mat.length) { Array.new(mat.first.length) }
  until queue.empty?
    t_row, t_col, c_row, c_col, dist = queue.shift

    next if visited[c_row][c_col] != nil

    if mat[c_row][c_col] == 0
      result[t_row][t_col] = [dist, result[t_row][t_col]].min
      return
    end

    visited[c_row][c_col] = true

    queue << [t_row, t_col, c_row + 1, c_col, dist + 1] if c_row + 1 < mat.length
    queue << [t_row, t_col, c_row - 1, c_col, dist + 1] if c_row - 1 >= 0
    queue << [t_row, t_col, c_row, c_col + 1, dist + 1] if c_col + 1 < mat[t_row].length
    queue << [t_row, t_col, c_row, c_col - 1, dist + 1] if c_col - 1 >= 0
  end
end
