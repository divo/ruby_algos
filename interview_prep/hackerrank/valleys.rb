#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'countingValleys' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER steps
#  2. STRING path
#

# Need to count the number of times we transition to sea level.
# Cant count the inital 0
# Need to ensure we count transitions as a single valley
def countingValleys(steps, path)
    # Write your code here
    alt = 0
    result = 0
    path.chars.each do |c|
      prev_alt = alt
      alt += 1 if c == 'U'
      alt -= 1 if c == 'D'
      result += leaving_vally?(prev_alt, alt)
    end
    
    result
end

def leaving_vally?(prev, alt)
  return 1 if prev == -1 && alt == 0 
  0
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

steps = gets.strip.to_i

path = gets.chomp

result = countingValleys steps, path

fptr.write result
fptr.write "\n"

fptr.close()

