# frozen_string_literal: true

# Luhn checks if a string is a valid Luhn
class Luhn
  def self.valid?(candidate)
    new(candidate).valid?
  end

  # Rubys love of instance state is a bit confusing to me
  def initialize(candidate)
    @candidate = candidate.delete(' ')
  end

  def valid?
    return false unless valid_input?

    @valid ||=
      begin
        digits = convert(@candidate)
        sum = sum(digits)
        luhn?(sum)
      end
  end

  private

  def valid_input?
    !!@candidate.match(/^(\d)+$/) && @candidate.length > 1
  end

  def convert(string)
    string.chars.map(&:to_i)
  end

  def sum(digits)
    digits.reverse.each_slice(2).sum do |first, second|
      first + double_in_place(second)
    end
  end

  def double_in_place(number)
    return 0 unless number # Handle odd number of digits

    result = number * 2
    result -= 9 if result > 9
    result
  end

  def luhn?(sum)
    (sum % 10).zero?
  end
end
