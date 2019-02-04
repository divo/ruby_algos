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
      if n != i
        @issued_names.push i
        @issued_names = @issued_names.sort
        return i
      end
    end

    @issued_names.push @issued_names.count
    return @issued_names.last
  end

  def delete_name(n)
    @issued_names.delete n
    puts  "deleted, now #{@issued_names}"
  end

end

def test
  factory = NameFactory.new()
  puts factory.issue_name
  puts factory.issue_name
  puts factory.issue_name
  factory.delete_name(1)
  puts factory.issue_name
  puts factory.issue_name
end

