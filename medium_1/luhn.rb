# frozen_string_literal: true

# luhn class
class Luhn
  def self.create(num)
    remainder = new(num * 10).checksum % 10
    num * 10 + (remainder.zero? ? 0 : 10 - remainder)
  end

  def initialize(num)
    @digits = num.digits
  end

  def addends
    @digits.map.with_index do |dig, idx|
      if idx.even?
        dig
      else
        dig * 2 >= 10 ? dig * 2 - 9 : dig * 2
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end
end
