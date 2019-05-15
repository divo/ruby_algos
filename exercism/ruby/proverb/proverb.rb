class Proverb

  def initialize(*list)
    @list = list
  end

  def to_s
    # Need to iterate and take two
    result = ""
    @list[1, @list.count].each_index do |i|
      result << template(@list[i], @list[i + 1])
    end
    result << end_template(@list.first)
  end

  def template(first, second)
    "For want of a #{first} the #{second} was lost.\n"
  end

  def end_template(first)
    "And all for the want of a #{first}."
  end
end
