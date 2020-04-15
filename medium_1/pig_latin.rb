# frozen_string_literal: true

# pig latin class with one class method
class PigLatin
  VOWELS = %w[a e i o u xr yt].freeze

  class << self
    def translate(phrase)
      phrase.split.map { |word| translate_word(word) }.join(' ')
    end

    private

    def translate_word(word)
      if vowel?(word)
        word
      else
        cons, rest = parse_consonant(word)
        rest + cons
      end + 'ay'
    end

    def vowel?(word)
      VOWELS.any? { |vowel| word =~ /\A#{vowel}\w+\z/ }
    end

    def parse_consonant(word)
      match_data = word.match(/\A(?<cons>[^aeiou]?qu|[^aeiou]+)(?<rest>\w+)\z/)
      [match_data[:cons], match_data[:rest]]
    end
  end
end
