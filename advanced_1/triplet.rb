# frozen_string_literal: true

# pythagorean triplet class
class Triplet
  def self.where(min_factor: 1, max_factor: 1, sum: nil)
    [*min_factor..max_factor].combination(3).map do |factors|
      new(*factors) if sum.nil? || factors.sum == sum
    end.compact.select(&:pythagorean?)
  end

  def initialize(num1, num2, num3)
    @nums = [num1, num2, num3].sort
  end

  def sum
    @nums.sum
  end

  def product
    @nums.reduce(:*)
  end

  def pythagorean?
    @nums[0]**2 + @nums[1]**2 == @nums[2]**2
  end
end
