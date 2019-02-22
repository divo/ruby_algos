class FlattenArray
  def self.flatten(array)
    array.flatten.select { |x| x }
  end
end
