# To implement enumerable for a class, simply provide an each that
# yields successive members of the collection. You must also provide <=>
# if using #min #max #sort

class EnumLike
  include Enumerable
  def each(&block)
    (0..10).each(&block)
  end

  def each_alternative
    (0..10).each { |x| yield x }
  end
end

enum = EnumLike.new()
enum.each { |x| puts x }
