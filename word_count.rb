
def words_from_string(string)
	string.downcase.scan(/[\w']+/)
end


def count_words(words)
	counts = Hash.new(0)
	for word in words
		counts[word] += 1
	end
	counts
end

p words_from_string("Hello there this is a test")
word_counts = count_words(words_from_string("Hello hello there, this is a test, test"))
p word_counts.sort_by {|word, count| count}
