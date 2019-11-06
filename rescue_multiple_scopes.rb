def throws
  nested do
    raise StandardError
  end
rescue StandardError => e
  puts "Error pass over multiple blocks"
end

def nested
  yield
end

throws
