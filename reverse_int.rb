# @param {Integer} x
# @return {Integer}
def reverse(x)
  # Convert to something we can reason about easily
  s = x.to_s
  a = s.split("")
  
  #Determine if negative
  if a.first == '-'
    a.shift
    neg = true
  end
  
  #Reverse it
  a = a.reverse
  
  # Remove leading 0s
  until a.empty? do
    if a.first == '0'
      a.shift
    else
      break
    end
  end
  
  result = a.join("").to_i
  # Put the nagative back
  result = neg.nil? ? result : result* -1
  result
end
