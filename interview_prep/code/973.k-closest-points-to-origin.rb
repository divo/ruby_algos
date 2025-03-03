# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  # Walk along the points, pushing to min heap. Trick is the comparitor
  heap = Containers::Heap.new { |x, y| (x <=> y) == -1 } # { |(x1, y1), (x2, y2)| Math.sqrt( x1*x1 + y1*y1 ) <  Math.sqrt( x2*x2 + y2*y2) }
  points.each { |x, y| heap.push(Math.sqrt( x*x + y*y), [x, y]) }
  # Pop K elements from heap and return them
  k.times.inject([]) { |result, _| result << heap.pop }
end

def k_closest_sort(points, k)
  points.sort_by { |x, y| Math.sqrt( x*x + y*y )}[..k - 1]
end


def k_closest(points, k)
  points
    .sort_by do |x, y|
      x.pow(2) + y.pow(2)
    end
    .take(k)
end
