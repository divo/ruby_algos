class NumArray

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @nums = nums
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
        @nums[i, j - i + 1].inject(:+)
    end


end

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(i, j)
