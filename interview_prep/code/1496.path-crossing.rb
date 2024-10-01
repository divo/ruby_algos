# @param {String} path
# @return {Boolean}
def is_path_crossing(path)
  x, y = 0, 0
  visited = [[x, y]]
  path.chars.each do |dir|
    case dir
    when "N"
      x += 0; y += 1
    when "S"
      x += 0; y -= 1
    when "E"
      x += 1; y += 0
    when "W"
      x -= 1; y += 0
    end

    return true if visited.include?([x, y])

    visited << [x, y]
  end

  false
end
