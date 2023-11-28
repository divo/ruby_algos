# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  points
    .sort_by do |x, y|
      x.pow(2) + y.pow(2)
    end
    .take(k)
end
