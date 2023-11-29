# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  # First find a place to insert the new interval so that
  # the start of the intervals is in order
  index = intervals.bsearch_index do |start, _|
    start > new_interval.first
  end

  if index
    intervals.insert(index, new_interval)
  else
    intervals << new_interval
  end

  # Then work left to right merging overlapping intervals
  result = [] << intervals.shift
  until intervals.empty?
    a, b = result.pop
    c, d = intervals.shift
    if (a..b).include? c
      result << [[a, c].min, [b, d].max]
    else
      result << [a, b] << [c, d]
    end
  end
  result
end
