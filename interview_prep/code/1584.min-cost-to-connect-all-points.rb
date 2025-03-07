 Category: algorithms
 Level: Medium
 Percent: 66.55329%



 You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].
 
 The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.
 
 Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.
 
  
 Example 1:
 
 Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
 Output: 20
 Explanation: 
 
 We can connect the points as shown above to get the minimum cost of 20.
 Notice that there is a unique path between every pair of points.
 
 
 Example 2:
 
 Input: points = [[3,12],[-2,5],[-4,1]]
 Output: 18
 
 
  
 Constraints:
 
 
 	1 <= points.length <= 1000
 	-10⁶ <= xi, yi <= 10⁶
 	All pairs (xi, yi) are distinct.
 
 

# @param {Integer[][]} points
# @return {Integer}

   # @param {Integer[][]} points
# @return {Integer}
# [[0,0],[2,2],[3,10],[5,2],[7,0]]
# Brute force, take the smallest distance reachable from the visited array on each iteration
FIXNUM_MAX = (2**(0.size * 8 -2) -1)

def min_cost_connect_points(points)
  n = points.length
  # First cacluate all the edges and costs
  adjacent = Array.new(n) { [] }
  for i in 0...n
    for j in (i + 1...n)
      cost = calc_cost(points[i], points[j])
      adjacent[i].push([cost, j])
      adjacent[j].push([cost, i])
    end
  end

  pp adjacent

  # Prims
  total_cost = 0
  visited = [] # List of indexes in points
  min_heap = Containers::MinHeap.new()
  min_heap.push(0, 0) # cost, point
  while visited.length < n
    cost, point_idx = min_heap.next_key, min_heap.pop
    next if visited.include?(point_idx)

    total_cost += cost
    visited << point_idx
    adjacent[point_idx].each do |cost, point|
      next if visited.include?(point)

      min_heap.push(cost, point)
    end
  end

  total_cost
end

def min_cost_connect_points_brute(points)
  visited = [] << points.shift
  cost = 0
  input_length = points.length
  while visited.length <= input_length
    min_cost = FIXNUM_MAX
    candidate = nil
    start = nil
    # All points are reachable from every other point, so we need a nested loop
    visited.each do |x|
      points.each do |y|
        c = calc_cost(x, y)
        if c < min_cost
          min_cost = c
          start = x
          candidate = y
        end
      end
    end
    visited << points.delete(candidate)
    cost += min_cost
  end

  cost
end

def calc_cost(a, b)
  (a.first - b.first).abs + (a.last - b.last).abs
end
