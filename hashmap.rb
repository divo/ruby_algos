class MyHashMap

=begin
    Initialize your data structure here.
=end
    def initialize()
      @store = Array.new(100)
      @entry = Struct.new(:key, :value)
    end


=begin
    value will always be non-negative.
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
      index = index(key)
      if @store[index].nil?
        @store[index] = [@entry.new(key, value)]
      else
        @store[index].append(@entry.new(key, value))
      end
    end


=begin
    Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
      return -1 if (bucket = @store[index(key)]).nil?
      result = bucket.select { |entry| entry.key == key }
      result || -1
    end


=begin
    Removes the mapping of the specified value key if this map contains a mapping for the key
    :type key: Integer
    :rtype: Void
=end
    def remove(key)
#      @store[index(key)].select { |entry| entry.key == key }
      entry = get(key)
      @store.delete(entry) unless entry == -1
    end

    def to_s
      @store.inject("") { |result, val| result += "#{val}, " }
    end

    private
    def index(key)
      key % @store.length
    end

end

# Your MyHashMap object will be instantiated and called as such:
obj = MyHashMap.new()
obj.put(1, 1)
obj.put(2, 2)
puts obj.get(1)
puts obj.get(3)
obj.put(2, 1)
puts obj.get(2)
obj.remove(2)
puts obj.get(2)
