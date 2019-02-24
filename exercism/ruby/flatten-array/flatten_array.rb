class FlattenArray
  def self.flatten(array)
    array.compact
      .map { |element| element.is_a?(Enumerable) ? flatten(element) : [element] }
      .inject([]) {|collection, element| collection + element}
  end
end

FlattenArray.flatten( [[0], [2], [[[2], [3]], [8], [[[100]]], [[]]], [-2]])
