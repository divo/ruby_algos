def colorful_number?(input)
  !combinations(input)
    .map { |seq| seq.inject(:*) }
    .inject(Set.new) { |set, val| set&.add?(val) }
    .nil?
end

def colorful_number?(input)
  combinations(input)
    .map { |seq| seq.inject(:*) }
    .inject(Set.new) do |set, val| 
      return false unless Set&.add?(val)
    end

  true
end

def combinations(input)
  chars = input.to_s.chars
  window_len = 0
  result = []
  while window_len < chars.length - 1
    left = 0
    while left + window_len < chars.length
      result << chars[left..left + window_len].map(&:to_i)
      left += 1
    end
    window_len += 1
  end

  result
end

pp colorful_number?(3245)
pp colorful_number?(326)

# 3 2 4 5 32 24 45 324 245
