def min_operations(boxes)
  indices = []
  boxes.chars.each_with_index do |box, i|
    indices << i if box == '1'
  end

  result = []
  boxes.size.times do |i|
    cnt = indices.reduce(0) { |sum, index| sum + (index - i).abs }
    result << cnt
  end
  result
end

