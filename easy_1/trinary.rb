# frozen_string_literal: true

# trinary class for challenge
class Trinary
  def initialize(tri_str)
    @tri = if tri_str.each_char.all? { |chr| ('0'..'2').cover? chr }
             tri_str.to_i
           else
             0
           end
  end

  def to_decimal
    idx = -1
    @tri.digits.sum do |dig|
      idx += 1
      dig * 3**idx
    end
  end
end
