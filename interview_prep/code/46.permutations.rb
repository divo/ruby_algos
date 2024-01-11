# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []
  build([], nums, result)
  result
end

def build(current, nums, result)
  buffer = current.dup
  if nums.empty?
    result << current.dup
    return
  end

  nums.each do |head|
    buffer << head
    tail = nums.dup
    tail.delete(head)
    build(buffer, tail, result)
    buffer.pop
  end
end

def permute_simple(nums)
  nums.permutation(nums.length).to_a
end

