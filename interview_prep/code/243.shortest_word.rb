# NOTE: This requires leetcode permium, which I don't have
def shortest_distance(words, word1, word2)
  l, r = 0, words.length - 1

  while l < words.length
    break if words[l] == word1

    l += 1
  end

  while r > 0
    break if words[r] == word2

    r -= 1
  end

  (l - r).abs
end

def shortest_distance_find(words, word1, word2)
  (words.index(word1) - words.index(word2)).abs
end

print shortest_distance(["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"], "fox", "dog")
