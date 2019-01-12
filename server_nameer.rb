class NameFactory
  @names

  def initialize
    @names = []
  end

  def issue_name
    # Find gap in array
    @names.each_with_index do |value, index|
      if value.nil?
        @names[index] = index
        return index
      end
    end

    @names.push(@names.count)
    return @names.last
  end

  def remove_name(name)
    return nil if name > @names.count
    @names[name] = nil
  end

  def to_s
    @names.inject("") { |result, val| result += "#{val}, " }
  end
end

factory = NameFactory.new()
puts factory.issue_name
puts factory.issue_name
puts factory.issue_name
puts factory.issue_name
puts factory
puts factory.remove_name(5)
factory.remove_name(1)
factory.remove_name(3)
puts factory
puts factory.issue_name
puts factory
puts factory.issue_name
