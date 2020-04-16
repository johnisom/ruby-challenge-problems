# frozen_string_literal: true

# phrase class for word counting
class Phrase
  def initialize(phrase)
    regex = /(\s|^)'# opening quote
      |'(\s|$)|     # ending quote
      [^a-z0-9']/ix # non-word & number chars & not apostrophes
    @words = phrase.gsub(regex, ' ').split.map(&:downcase)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1 }
  end
end
