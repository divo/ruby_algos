class Luhn
  def valid(id)
    # Algo:
  end

  # Must have length > 1
  # Spaces are allowed but must be stripped
  # All other non number chars are not allowed
  def validate_input(id)
    return false if id.length <= 1
  end

  # Double every second digit
  # If doubling results in no > 9, then subtract 9 from the product
  # Sum all the digits, it's divisible by 10 then it's valid
  def is_luhn?(id)

  end

  # TODO: Better name for this
  def double_in_place(id)

  end
end
