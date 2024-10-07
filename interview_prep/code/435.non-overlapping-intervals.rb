# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  result = 0
  intervals.sort!
  index = 0
  while index < intervals.count - 1
    current_interval = intervals[index]
    next_interval = intervals[index + 1]

    if overlapping?(current_interval, next_interval)
      result += 1
      intervals.delete_at(index + 1)
    else
      index += 1
    end
  end

  result
end

def overlapping?(left, right)
  left.last > right.first
end

puts erase_overlap_intervals([[-52, 31], [-73, -26], [82, 97], [-65, -11], [-62, -49], [95, 99], [58, 95], [-31, 49], [66, 98], [-63, 2],
                              [30, 47], [-40, -26]])
