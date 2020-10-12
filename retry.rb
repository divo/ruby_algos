def test
  (0..10).each do |i|
    puts i
    raise StandardError if i == 5
  rescue StandardError => e
    retry
  end
end

test
