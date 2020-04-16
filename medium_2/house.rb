# frozen_string_literal: false

# 'this is the house that jack built' class
class House
  class << self
    def recite
      1.upto(pieces.size).with_object('') do |verse, result|
        result << 'This is ' + pieces[-verse..-1].map do |arr|
          arr.join("\n")
        end.join(' ') + ".\n\n"
      end[0...-1]
    end

    private

    def pieces # rubocop:disable Metrics/MethodLength
      [
        ['the horse and the hound and the horn', 'that belonged to'],
        ['the farmer sowing his corn', 'that kept'],
        ['the rooster that crowed in the morn', 'that woke'],
        ['the priest all shaven and shorn', 'that married'],
        ['the man all tattered and torn', 'that kissed'],
        ['the maiden all forlorn', 'that milked'],
        ['the cow with the crumpled horn', 'that tossed'],
        ['the dog', 'that worried'],
        ['the cat', 'that killed'],
        ['the rat', 'that ate'],
        ['the malt', 'that lay in'],
        ['the house that Jack built']
      ]
    end
  end
end
