# frozen_string_literal: true

# perfect number classification class
class PerfectNumber
  def self.classify(int)
    raise if int.negative?

    case (1...int).select { |num| (int % num).zero? }.sum <=> int
    when 1  then 'abundant'
    when 0  then 'perfect'
    when -1 then 'deficient'
    end
  end
end
