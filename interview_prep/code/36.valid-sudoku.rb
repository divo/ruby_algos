# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  9.times do |n|
    return false unless validate_row(n, board)
    return false unless validate_col(n, board)
  end

  [0, 3, 6].each do |i|
    [0, 3, 6].each do |j|
      return false unless validate_grid(i, j, board)
    end
  end
  true
end

def validate_row(n, board)
  @set = []
  board[n].each do |x|
    return false if contains_element(x)
  end
  true
end

def validate_col(col, board)
  @set = []
  board.length.times do |row|
    x = board[row][col]
    return false if contains_element(x)
  end
  true
end

# Validate 3 x 3 grid starting at i, j
def validate_grid(i, j, board)
  @set = []
  3.times do |x|
    3.times do |y|
      element = board[i + x][j + y]
      return false if contains_element(element)
    end
  end

  true
end

def contains_element(x)
  return false if x == '.'
  return true if @set[x.to_i]

  @set[x.to_i] = true
  false
end
