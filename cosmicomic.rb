require "pry"

def anagram?(word1, word2)
	word1.chars.sort == word2.chars.sort
end

def joiner?(word1, word2)
	word1[-1] == word2[0]
end

def funny_word?(word1, word2)
	anagram?(word1,word2) && joiner?(word1,word2)
end

def join_words(word1, word2)
	word1 + word2[1..-1]
end

