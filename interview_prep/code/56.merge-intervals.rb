# @param {Integer[][]} intervals
# @return {Integer[][]}
# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
def merge(intervals)
  merge_all_intervals(intervals.sort, nil, nil)
end

def merge_all_intervals(intervals, rindex = nil, lindex = nil)
  merge_interval(intervals, rindex, lindex) if rindex

  intervals[...intervals.length - 1].each_with_index do |range, index|
    n_interval = intervals[index + 1].to_r
    c_interval = range.to_r
    if n_interval.overlap(c_interval)
      return merge_all_intervals(intervals, index, index + 1)
    end
  end

  return intervals
end

def merge_interval(intervals, rindex, lindex)
  right, left = intervals[rindex], intervals[lindex]
  intervals[rindex] = [[right.first, left.first].min, [right.last, left.last].max]
  intervals.delete_at(lindex)
  intervals
end

class Array
  def to_r
    return (self.first..self.last)
  end
end

class Range
  def overlap(other)
    self.include?(other.first) || self.include?(other.last) ||
    other.include?(self.first) || other.include?(self.last)
  end
end
