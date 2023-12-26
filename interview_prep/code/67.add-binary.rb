# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  longer, shorter = a.length > b.length ? [a.chars, b.chars] : [b.chars, a.chars]
  carry = 0
  result = []
  until longer.empty?
    x = longer.pop
    y = shorter.pop || 0
    case (x.to_i + y.to_i + carry.to_i)
    when 0
      result.unshift "0"
      carry = 0
    when 1
      result.unshift "1"
      carry = 0
    when 2
      result.unshift "0"
      carry = 1
    when 3
      result.unshift "1"
      carry = 1
    end
  end
  result.unshift(carry.to_s) if carry == 1
  result.join
end
