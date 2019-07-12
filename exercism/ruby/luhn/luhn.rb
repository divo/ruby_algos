# frozen_string_literal: true

# Luhn checks if a string is a valid Luhn
class Luhn
  class << self
    def valid?(id)
      id.delete!(' ')
      return false unless valid_input?(id)

      digits = to_i_a(id)
      digits = double_every_second(digits)
      luhn?(digits)
    end

    def valid_input?(id)
      !!id.match(/^(\d)+$/) && id.length > 1
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
