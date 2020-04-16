# frozen_string_literal: true

# octal class for challenge
class Octal
  def initialize(oct_str)
    @oct = if oct_str.each_char.all? { |chr| ('0'..'7').cover?(chr) }
             oct_str.to_i
           else
             0
           end
  end

  def to_decimal
    idx = -1
    @oct.digits.sum do |dig|
      idx += 1
      dig * 8**idx
    end
  end
end
