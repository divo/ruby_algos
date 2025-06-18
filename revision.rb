require 'JSON'
require 'Date'

def title_case(str)
#  str.split(" ").map { |word| word.first.uppercase! }.join(" ")
  str.split(" ")
    .map { |word| word.chars.first.upcase! + word.chars[1..].join }
    .join(" ")
end

def word_count(str)
  strings = str.downcase.gsub(/[^a-z0-9\s]/i, '').split
  strings.each_with_object(Hash.new() { 0 }) { |word, memo| memo[word] += 1}
end

def rotate_array(arr, count)
  count = arr.length + count if count < 0
  count.times do |_|
    arr.unshift(arr.pop)
  end
  arr
end

def sum_unique(nums)
  nums.each_with_object(Hash.new() { 0 }) { |num, memo| memo[num] += 1 }
    .select { |k, v| v == 1}
    .keys.sum
end

def anagram?(w1, w2)
  w1.downcase.gsub(/[^a-z0-9]/i, '').chars.sort == w2.downcase.gsub(/[^a-z0-9]/i, '').chars.sort
end

puts title_case("the quick brown fox") #=> "The Quick Brown Fox"

puts word_count("Hello hello, world!") #=> {"hello"=>2, "world"=>1}

pp rotate_array([1,2,3,4,5], 2)  #=> [4,5,1,2,3]
pp rotate_array([1,2,3,4,5], -1) #=> [2,3,4,5,1]

puts sum_unique([1,2,2,3,4,4,5]) #=> 1+3+5 = 9

puts anagram?("listen", "silent")      #=> true
puts anagram?("Dormitory", "dirty room") #=> true

# JSON
JSON.parse('{"name":"Alice","age":30}').each{ |key, value| puts "#{key} : #{value}"}

puts JSON.parse('{
  "library": {
    "books": [
      {"title":"1984","author":"Orwell"},
      {"title":"Brave New World","author":"Huxley"}
    ]
  }
  }')['library']['books'].map { |book| book['title'] }

puts
puts JSON.parse('[
  { "name": "Alice",   "score": 92 },
  { "name": "Bob",     "score": 67 },
  { "name": "Charlie", "score": 75 },
  { "name": "Dana",    "score": 83 },
  { "name": "Evan",    "score": 54 }
  ]').select { |entry| entry['score'] >= 75}

puts

settings = JSON.parse('{
  "theme": "light",
  "notifications": true,
  "volume": 75,
  "shortcuts": {
    "save": "Ctrl+S",
    "open": "Ctrl+O",
    "quit": "Ctrl+Q"
  }
  }')
settings['theme'] = "dark"
puts settings.to_json
puts

objects = JSON.parse('[
  { "id": 101, "name": "Widget",    "price": 9.99,  "in_stock": true  },
  { "id": 102, "name": "Gadget",    "price": 14.50, "in_stock": false },
  { "id": 103, "name": "Doohickey", "price": 4.75,  "in_stock": true  }
]')

puts "id, name, price, in_stock"
objects.each do |row|
  puts row.values.join(",")
end

# Console
# Read from STDIN
def said
  said = STDIN.gets.chomp
  puts "You said: #{said}"
end
# said

def adds
  puts "Please enter first number"
  no1 = STDIN.gets.chomp.to_i
  puts "Please enter second number"
  no2 = STDIN.gets.chomp.to_i
  puts no1 + no2
end
# adds

def menu
  loop do
    puts "Please enter choice: \n 1) Hello\n2) Date\n3) Exit"
    no1 = STDIN.gets.chomp.to_i
    raise "Can't you read!" unless no1 <= 3 || no1 >= 1

    case no1
    when 1
      puts "Hello"
    when 2
      puts Time.new
    when 3
      break
    end
  end
end
# menu

def line_counter(filename)
  File.open(filename) do |file|
    puts file.readlines.count
  end
end

def string_search(filename, string)
  File.open(filename) do |file|
    file.readlines.each do |line|
      puts line if line.include?(string)
    end
  end
end

line_counter(ARGV.first)
string_search(ARGV.first, ARGV[1])
