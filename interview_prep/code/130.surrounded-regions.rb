# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  # Walk the edges of the board and search for anything connected to a 0
  # Anything region not connected to the edge of the board can be surrouneded
  # To walk the edge of the board, iterate over everything and just skip anything not at the edge
  edge_regions = Array.new(board.length) { Array.new(board.length) { false } }

  board.each_with_index do |row, i|
    row.each_with_index do |val, j|
      next unless i.zero? || i == board.length - 1 || j.zero? || j == board.first.length - 1

      # Search from the edges for all connected regions
      search(board, i, j, edge_regions) if val == 'O'
    end
  end

  # Capture all points not part of edge_regions
  board.each_with_index do |row, i|
    row.each_with_index do |_val, j|
      board[i][j] = 'X' unless edge_regions[i][j]
    end
  end

  board
end

def search(board, i, j, edge_regions)
  queue = [[i, j]]
  visited = Array.new(board.length) { Array.new(board.length) { false } }
  until queue.empty?
    row, col = queue.shift
    edge_regions[row][col] = true

    queue.unshift([row + 1, col]) if connected(board, row + 1, col, visited)
    queue.unshift([row - 1, col]) if connected(board, row - 1, col, visited)
    queue.unshift([row, col + 1]) if connected(board, row, col + 1, visited)
    queue.unshift([row, col - 1]) if connected(board, row, col - 1, visited)
  end
end

def connected(board, row, col, visited)
  return false if row < 0 || row >= board.length || col < 0 || col >= board.first.length

  return false if visited[row][col]

  visited[row][col] = true

  board[row][col] == 'O'
end
