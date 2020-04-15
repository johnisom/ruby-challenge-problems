# frozen_string_literal: true

class ValueError < StandardError; end
# Board class
class Board
  class << self
    def transform(brd)
      raise ValueError, 'invalid board layout' if invalid?(brd)

      brd.map.with_index do |row, r_i|
        row.chars.map.with_index do |chr, c_i|
          chr == ' ' ? extract(brd, r_i, c_i).count('*') : chr
        end.join.gsub('0', ' ')
      end
    end

    private

    def invalid?(brd)
      width = brd[0].size
      /[^+-]/ =~ brd[0] + brd[-1] || brd[1..-2].any? do |row|
        /[^*| ]/ =~ row || row.size != width || row[0] + row[-1] != '||'
      end
    end

    def extract(brd, r_i, c_i)
      brd[r_i - 1][c_i - 1, 3] + brd[r_i][c_i - 1, 3] + brd[r_i + 1][c_i - 1, 3]
    end
  end
end

# How I'm gonna implement this -- second approach.
# Row by row, character by character, I'll set that char equal to the
# count of adjacent mines if it is a space char, otherwise keep the original
# char. To count, I need to create a nested array (map brd to its chars, ex.
# brd.map(&:chars)) and work with that, going through the rows and columns with
# the indices for each so I can count the rows up and down, the columns left and
# right, and the diagonals left up and left down and right up and right down. I'll use
# a count variable and add it if the char is a mine
