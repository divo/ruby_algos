# frozen_string_literal: true

# Luhn checks if a string is a valid Luhn
class Luhn
  class << self
    def valid?(id)
      return false unless (id = validate_input(id))

      digits = to_i_a(id)
      digits = double_every_second(digits)
      luhn?(digits)
    end

    # Question for mentor: Would it be better to return nil here?
    # false and a string are two different value types,
    # which seems like a confusing thing for a method to do.
    # On the other hand returning nil forces the caller to 
    # type check the result, not just look at the value
    # Which is more idiomatic?
    def validate_input(id)
      id.delete!(' ')
      if id.match(/^(\d)+$/).nil? || id.length <= 1
        false
      else
        id
      end
    end

    def to_i_a(string)
      string.chars.map(&:to_i)
    end

    def double_every_second(digits)
      digits.reverse.each_slice(2).flat_map do |first, second|
        [first, double_in_place(second)]
      end
    end

    def double_in_place(number)
      return nil unless number # Handle odd number of digits

      result = number * 2
      result -= 9 if result > 9
      result
    end

    def luhn?(digits)
      (digits.compact.sum % 10).zero?
    end
  end
end
