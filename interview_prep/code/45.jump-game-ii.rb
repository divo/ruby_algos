# @param {Integer[]} nums
# @return {Integer}
# Iterate nums in reverse, storing paths to the goal. If an number can reach the start of a
# path, add it to that path. Then return the length of the shortest path
# [2, 3, 1, 1, 4]
def jump(nums)
  paths = [[nums.length - 1]]
  nums.each_with_index.to_a.reverse.drop(1).each do |val, idx|
    # If the current value can reach the last node in a path, add it to that path
    paths.length.times do |n|
      paths << (paths[n].clone << idx) if paths[n].last - idx <= val
    end
  end

  # Now return the length of the shortest path
  paths.select { |path| path.last.zero? }.map(&:length).min - 1
end
