# @param {Integer[][]} intervals
# @return {Integer}
# [[1,2],[2,3],[3,4],[1,3]]
# [[1,2],[3,4],[1,3]]
def erase_overlap_intervals(intervals, count = 0)
  intervals.sort!
  idx = 0
  count = 0
  while idx < intervals.count - 1
    if overlapping?(intervals[idx], intervals[idx + 1])
      # Figure out which one to remove
      intervals.delete_at(ends_last(intervals, idx, idx + 1))
      count += 1
    else
      idx += 1
    end
  end
  count
end

def overlapping?(left, right)
  left.last > right.first
end

def ends_last(intervals, l, r)
  intervals[l].last < intervals[r].last ? r : l
end


# def erase_overlap_intervals(intervals)
#   result = 0
#   intervals.sort!
#   index = 0
#   while index < intervals.count - 1
#     current_interval = intervals[index]
#     next_interval = intervals[index + 1]
# 
#     if overlapping?(current_interval, next_interval)
#       result += 1
#       intervals.delete_at(index + 1)
#     else
#       index += 1
#     end
#   end
# 
#   result
# end
# 
# def overlapping?(left, right)
#   left.last > right.first
# end
# 
# puts erase_overlap_intervals([[-52, 31], [-73, -26], [82, 97], [-65, -11], [-62, -49], [95, 99], [58, 95], [-31, 49], [66, 98], [-63, 2],
                              [30, 47], [-40, -26]])
