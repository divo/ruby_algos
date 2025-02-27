# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
# Input: image = [[1,2,1],[2,2,0],[1,0,1]], sr = 1, sc = 1, color = 2
# sel: 1
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
# Newer solution, done in 20 mins. Improvement
def flood_fill(image, sr, sc, color, target = nil)
  target ||= image[sr][sc]

  return image if color == target

  return image unless fill(image, sr, sc, color, target)

  flood_fill(image, sr + 1, sc, color, target)
  flood_fill(image, sr - 1, sc, color, target)
  flood_fill(image, sr, sc + 1, color, target)
  flood_fill(image, sr, sc - 1, color, target)
end

def fill(image, x, y, color, target)
  return false unless x >= 0 && x < image.length
  return false unless y >= 0 && y < image[x].length
  return false if image[x][y] != target

  image[x][y] = color
  true
end

def flood_fill(image, sr, sc, color)
  sel_color = image[sr][sc]
  return image if sel_color == color

  queue = [[sr, sc]]
  until queue.empty?
    x, y = queue.pop
    next unless image[x][y] == sel_color

    image[x][y] = color
    queue << [x - 1, y] if x - 1 >= 0
    queue << [x + 1, y] if x + 1 < image.length
    queue << [x, y - 1] if y - 1 >= 0
    queue << [x, y + 1] if y + 1 < image[x].length
  end

  image
end

def flood_fill_rec(image, sr, sc, color)
  return image if image[sr][sc] == color

  sel_color = image[sr][sc]
  flood_fill_recursive(image, sr, sc, color, sel_color)
  image
end

def flood_fill_recursive(image, sr, sc, color, sel_color = nil)
  # Check if we are in image bounds
  return image if sr < 0 || sc < 0
  return image if sr >= image.length || sc >= image[sr].length

  if image[sr][sc] == sel_color
    image[sr][sc] = color
    flood_fill_recursive(image, sr - 1, sc, color, sel_color)
    flood_fill_recursive(image, sr + 1, sc, color, sel_color)
    flood_fill_recursive(image, sr, sc + 1, color, sel_color)
    flood_fill_recursive(image, sr, sc - 1, color, sel_color)
  end
  image
end
