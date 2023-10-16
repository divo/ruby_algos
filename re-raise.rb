class Throwing
  def a
    begin
      raise ArgumentError
    rescue StandardError => e
      puts 'Got StandardError'
      require 'byebug'; byebug;
      raise e
    rescue ArgumentError => e
      require 'byebug'; byebug;
      puts 'Got ArgumentError'
    end
  end
end

Throwing.new.a
