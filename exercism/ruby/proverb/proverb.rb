class Proverb

  def initialize(*list, qualifier: "")
    @list = list
    @qualifier = qualifier
  end

  def to_s
    # Need to iterate and take two
    result = @list.each_cons(2).inject("") do |result, (first, second)|
      result << template(first, second)
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
