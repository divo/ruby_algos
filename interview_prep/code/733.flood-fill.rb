# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
# Input: image = [[1,2,1],[2,2,0],[1,0,1]], sr = 1, sc = 1, color = 2
# sel: 1

# Iterative, BFS
def flood_fill(image, sr, sc, color)
  target = image[sr][sc]
  return image if target == color

  queue = [[sr, sc]]
  while !queue.empty?
    head = queue.shift
    row = head.first
    col = head.last
    if image[row][col] == target
      image[row][col] = color

      queue << [row - 1, col] if row - 1 >= 0
      queue << [row, col + 1] if col + 1 < image[row].length
      queue << [row + 1, col] if row + 1 < image.length
      queue << [row, col - 1] if col - 1 >= 0
    end
  end

  image
end

def flood_fill_recursive(image, sr, sc, color, sel_color = nil)
  if sel_color.nil?
    sel_color = image[sr][sc]
    return image if color == sel_color

    flood_fill(image, sr, sc, color, sel_color)
  else
    return if image[sr].nil?
    return if image[sr][sc].nil?
    return if image[sr][sc] != sel_color
    return unless (0...image.length).include? sr
    return unless (0...image[sr].length).include? sc

    image[sr][sc] = color
    flood_fill(image, sr + 1, sc, color, sel_color)
    flood_fill(image, sr - 1, sc, color, sel_color)
    flood_fill(image, sr, sc + 1, color, sel_color)
    flood_fill(image, sr, sc - 1, color, sel_color)
  end

  image
end

