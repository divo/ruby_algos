# @param {Integer[][]} intervals
# @return {Integer[][]}
# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# @param {Integer[][]} intervals
# @return {Integer[][]}
# 1. Detect overlapping intervals
# 2. Merge overlapping intervals
# [[1,3],[2,6],[8,10],[15,18]]
# [[1,6],[8,10],[15,18]]
def merge(intervals)
  intervals.sort!

  left = 0
  right = 1
  while right < intervals.length
    if overlap?(intervals[left], intervals[right])
      intervals = merge_interval(intervals, left, right)
    else
      left += 1
      right += 1
    end
  end

  intervals
end

def merge_interval(intervals, l, r)
  intervals[l] = [intervals[l].first, [intervals[l].last, intervals[r].last].max]
  intervals.delete_at(r)
  intervals
end

def overlap?(a, b)
  a.last >= b.first
end
