# frozen_string_literal: true

# diamond module for creating alphebetical diamond strings
module Diamond
  class << self
    def make_diamond(letter)
      pad_num = [*'A'..'Z'].index(letter)
      (top(pad_num) + bottom(pad_num)).join
    end

    private

    def top(pad_num)
      [*'A'...letter].map.with_index do |ltr, idx|
        pad = ' ' * (pad_num - idx)
        center = ' ' * (2 * idx - (idx.zero? ? 0 : 1))
        second = idx.zero? ? '' : ltr
        "#{pad}#{ltr}#{center}#{second}#{pad}\n"
      end
    end

    def bottom(pad_num)
      [*'A'..letter].reverse.map.with_index do |ltr, idx|
        pad = ' ' * idx
        center = ' ' * (2 * (pad_num - idx) - (idx == pad_num ? 0 : 1))
        second = (idx == pad_num ? '' : ltr)
        "#{pad}#{ltr}#{center}#{second}#{pad}\n"
      end
    end
  end
end
