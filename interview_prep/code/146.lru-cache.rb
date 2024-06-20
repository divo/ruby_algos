# frozen_string_literal: true

# LRUCache
class LRUCache
  # =begin
  #     :type capacity: Integer
  # =end
  def initialize(capacity)
    @store = {}
    @timestamps = {}
    @capacity = capacity
    @tick = 0
  end

  # =begin
  #     :type key: Integer
  #     :rtype: Integer
  # =end
  def get(key)
    value = @store[key]
    if value
      @timestamps[key] = @tick
      @tick += 1
      return value
    else
      -1
    end
  end

  # =begin
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    if @store[key]
      @store[key] = value
      @timestamps[key] = @tick
      @tick += 1
      return
    end

    if @store.length >= @capacity
      # Evict the least recently used item.
      evict
    end

    @store[key] = value
    @timestamps[key] = @tick
    @tick += 1
  end

  private

  def evict
    # Find the least recently used item.
    lru_key = @timestamps.sort_by { |k, v| v }.first.first
    @store.delete(lru_key)
    @timestamps.delete(lru_key)
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
