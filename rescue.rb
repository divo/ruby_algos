class Throwing
  def a
    raise ArgumentError
  rescue ArgumentError => e
    puts 'Got ArgumentError'
  rescue StandardError => e
    puts 'Got StandardError'
  end
end

Throwing.new.a
