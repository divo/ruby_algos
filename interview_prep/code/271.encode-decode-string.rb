# Premium problem
# Problem: Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings. Please implement encode and decode

# Encodes a list of strings to a single string.
#
# @param {string[]} strs
# @return {string}
def encode(strs)
  return strs.each_with_object("") do |cur, acc| 
    acc << "#{cur.chars.map { |x| x.ord.to_s }.join(",")}\n"
  end
end

# Decodes a single string to a list of strings.
#
# @param {string} s
# @return {string[]}
def decode(s)
  s.each_line.map do |nums|
    # nums[...-1] is a simple way of droping the last character
    # nums[...-1].split(",").map(&:to_i).map(&:chr).join("")
    nums.chop.split(",").map(&:to_i).map(&:chr).join("")
  end
end

input = ["we", "say", ":", "yes"]
require 'byebug'; byebug;
puts encode(input)
# puts decode(encode(input))
