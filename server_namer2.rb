class NameFactory
  @issued_names

  def initialize
    @issued_names = []
  end

  # Not using nils
  def issue_name
    if @issued_names.empty?
      @issued_names.push 0
      return 0
    end

    @issued_names.each_with_index do |n, i|
      #If last element, increment + add it
      if n == @issued_names.last
        @issued_names.push n.next
        return n.next
      elsif n != @issued_names[i.next] - 1
        @issued_names.push n
        @issued_names = @issued_names.sort
        return n
      end
    end
  end

end

factory = NameFactory.new()
puts factory.issue_name
puts factory.issue_name
puts factory.issue_name
