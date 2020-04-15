# frozen_string_literal: false

# queens class
class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError, 'the queens cannot occupy same space' if white == black

    @white = white
    @black = black
  end

  def to_s
    board = Array.new(8) { '_ _ _ _ _ _ _ _' }
    board[white[0]][white[1] * 2] = 'W'
    board[black[0]][black[1] * 2] = 'B'
    board.join("\n")
  end

  def attack?
    white[0] == black[0] || white[1] == black[1] || diagonal?
  end

  private

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end
end
