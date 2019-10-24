def throwing
  puts 'run'
  raise StandardError, 'Method'
  1
rescue
  puts 'rescued'
  raise StandardError, 'Rescued'
  2
ensure
  puts 'ensured'
  3
end


puts throwing
