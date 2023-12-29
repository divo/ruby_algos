# @param {Integer} num_ones
# @param {Integer} num_zeros
# @param {Integer} num_neg_ones
# @param {Integer} k
# @return {Integer}
def k_items_with_maximum_sum(num_ones, num_zeros, num_neg_ones, k)
  (Array.new(num_ones) { 1 } + Array.new(num_zeros) { 0 } + Array.new(num_neg_ones) { -1 })
    .first(k)
    .sum
end
