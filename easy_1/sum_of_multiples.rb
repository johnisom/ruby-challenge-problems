# frozen_string_literal: true

# sum of multiples class for challenge
class SumOfMultiples
  def self.to(lim)
    new(3, 5).to(lim)
  end

  def initialize(*nums)
    @nums = nums.sort
  end

  def to(lim)
    @nums.map { |num| mults(num, lim) }.flatten.uniq.sum
  end

  private

  def mults(num, lim)
    range = (lim % num).zero? ? (1...lim / num) : (1..lim / num)
    range.map { |elt| elt * num }
  end
end
