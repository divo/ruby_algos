# How to return different behaviour based on argument?
# We could include different stuff?

class Cache
  def initialize(max_size: 1000, strat: :fifo)
    @max_size = max_size
    @store = {}

    case strat
    when :fifo
      extend FifoCache
    when :lfu
      extend LFUCache
    end
  end

  def to_s
    @store.to_s
  end
end

module LFUCache
  def set(key, value)
    if @store.size >= @max_size
      # Need some structure to store the counts
      key_to_evit = @store.sort_by { |_key, value| value.last }.first.first
      @store.delete(key_to_evit)
    end

    @store[key] = [value, 0]
  end

  def get(key)
    value = @store[key]
    value[1] += 1
    value[0]
  end
end

module FifoCache
  def set(key, value)
    if @store.size >= @max_size
      @store.delete(keys.shift)
    end

    @store[key] = value
    keys << key
  end

  def get(key)
    @store[key]
  end

  def keys
    @keys ||= []
  end
end


cache = Cache.new(max_size: 5, strat: :lfu)
# cache = Cache.new(max_size: 5)
cache.set('key_1', 1)
cache.set('key_2', 2)
cache.set('key_3', 3)
cache.set('key_4', 4)
puts cache.get 'key_1'
puts cache.get 'key_2'
puts cache.get 'key_3'
puts cache.get 'key_4'
cache.set('key_5', 5)
cache.set('key_6', 6)
puts cache
