# frozen_string_literal: true

# Consider a character set consisting of letters, a space, and a point.
# Words consist of one or more, but at most 20 letters. An input text
# consists of one or more words separated from each other by one or more
# spaces and terminated by 0 or more spaces and followed by a point.
# The output text is to be produced such that successive words are
# separated by a single space with the last word beging terminated by a
# single point. Odd words are copied in reverse order while even words
# are merely echoed. For example, the input string
#
# "whats the matter with kansas." becomes "whate eht matter htiw kansas."
#
# BONUS POINTS: the characters must be read and printed one at a time.
#
# Other examples:
#
# "hello  grand    america hotel ." becomes "hello dnarg america letoh."
# "abcdefghijklmnopqrstuvwxyz." raises exception

def reverse_odd(str)
  dot = str[-1] == '.'

  words = str.gsub(/\s+/, ' ').sub(/\s*\./, '').split
  raise 'word longer than 20 letters' if words.any? { |word| word.length > 20 }

  words.map.with_index do |word, idx|
    idx.odd? ? word.reverse : word
  end.join(' ') + (dot ? '.' : '')
end

p reverse_odd('whats the matter with kansas.')
p reverse_odd('hello  grand    america hotel .')

begin
  reverse_odd('abcdefghijklmnopqrstuvwxyz.')
rescue RuntimeError
  puts '=' * 30, 'successfully raised exception!', '=' * 30
end

p reverse_odd('')
p reverse_odd('.')
p reverse_odd('hello')
p reverse_odd('hello.')
