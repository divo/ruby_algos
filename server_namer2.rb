class NameFactory
  @issued_names

  def initialize
    @issued_names = []
  end

  # Not using nils
  def issue_name
    print @issued_names
    if @issued_names.empty?
      @issued_names.push 0
      return 0
    end

    @issued_names.each_with_index do |n, i|
      #If last element, increment + add it
      if n == @issued_names.last
        @issued_names.push n.next
        return n.next
      elsif n.next != @issued_names[i.next]
        @issued_names.push n.next
        @issued_names = @issued_names.sort
        return n.next
      end
    end
  end

  def delete_name(n)
    @issued_names.delete n
    print @issued_names
  end

end

factory = NameFactory.new()
puts factory.issue_name
puts factory.issue_name
puts factory.issue_name
factory.delete_name(1)
puts factory.issue_name
puts factory.issue_name
