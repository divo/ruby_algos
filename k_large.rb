input = [3, 2, 1, 5, 6, 4]
k = 2

def k_largest(k, list)
  # Presume positive number
  k_list = Array.new(k) { 0 }
  list.each do |n|
    # Check if n larger than smallest element in k_list
    if n > k_list.min
      # Delete the min element
      # This is pretty terrible. I'd fail someone if they showed me this
      # but for 10 mins it's whatever
      min_index = k_list.index(k_list.min)
      k_list.delete_at(min_index)
      k_list << n
    end
  end

  k_list.min
end

puts k_largest(k, input)
