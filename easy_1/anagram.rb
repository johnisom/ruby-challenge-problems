# frozen_string_literal: true

# anagram class
class Anagram
  def initialize(word)
    @word = word.downcase
    @chars = @word.each_char.sort.join
  end

  def match(words_arr)
    words_arr.select do |word|
      downcased = word.downcase
      sorted = downcased.each_char.sort.join
      downcased != @word && sorted == @chars
    end
  end
end
