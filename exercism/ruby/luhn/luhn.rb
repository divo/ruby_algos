# frozen_string_literal: true

# Luhn checks if a string is a valid Luhn
class Luhn
  class << self
    def valid?(id)
      return false if (id = validate_input(id)).nil?

      digits = to_i_a(id)
      digits = double_every_second(digits)
      luhn?(digits)
    end

    def validate_input(id)
      id.delete!(' ')
      if id.match(/^(\d)+$/).nil? || id.length <= 1
        nil
      else
        id
      end
    end

    def to_i_a(string)
      string.chars.map(&:to_i)
    end

    # TODO: Clean this up
    def double_every_second(digits)
      result = []
      digits.reverse.each_slice(2) do |first, second|
        result << first
        result << double_in_place(second)
      end

      result
    end

    def double_in_place(number)
      return nil if number.nil? # Handle odd number of digits

      result = number * 2
      result -= 9 if result > 9
      result
    end

    def luhn?(digits)
      (digits.compact.sum % 10).zero?
    end
  end
end
