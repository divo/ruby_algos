class Luhn
  class << self
    def valid?(id)
      return false if (id = validate_input(id)).nil?
      is_luhn?(id)
    end

    # Must have length > 1
    # Spaces are allowed but must be stripped
    # All other non number chars are not allowed
    def validate_input(id)
      id = id.delete(' ')
      return nil if id.match(/^(\d)+$/).nil?
      return nil if id.length <= 1
      id
    end

    # Double every second digit
    # If doubling results in no > 9, then subtract 9 from the product
    # Sum all the digits, it's divisible by 10 then it's valid
    def is_luhn?(id)
      digits = id.chars.map(&:to_i)
      result = []
      digits.each_slice(2) do |first, second|
        result << first
        result << double_in_place(second)
      end

      result.compact.sum % 10 == 0
    end

    # TODO: Better name for this
    def double_in_place(number)
      return nil if number.nil? # Handle odd number of digits
      result = number * 2
      if result > 9
        result = result - 9
      end
      result
    end
  end
end
