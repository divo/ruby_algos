class Proverb

  def initialize(*list, qualifier: "")
    @list = list
    @qualifier = qualifier
  end

  def to_s
    # Need to iterate and take two
    result = ""
    @list[1, @list.count].each_index do |i|
      result << template(@list[i], @list[i + 1])
    end
    result << end_template(@list.first, @qualifier)
  end

  def template(first, second)
    "For want of a #{first} the #{second} was lost.\n"
  end

  def end_template(last, qualifier)
    qualifier += " " unless qualifier.empty?
    "And all for the want of a #{qualifier}#{last}."
  end
end
