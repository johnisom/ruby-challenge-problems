# frozen_string_literal: true

# solution: use combination of row number and index in that row
# so 5th row 3rd spot is 5 choose 3 (5!/((5-3)!3!))
# formula: n.choose(r) = n!/((n-r)!r!)

# or, use by calculating from previous row (recursive). but I chose
# to use the more mathematical probabilistic approach rather than the
# geometric approach for this one.

# class for pascals triangle
class Triangle
  attr_reader :rows

  def initialize(row_count)
    @rows = generate(row_count)
  end

  private

  def generate(num)
    (1..num).map do |row|
      (0...row).map { |i| combination(row - 1, i) }
    end
  end

  # rubocop:disable Naming/UncommunicativeMethodParamName
  def combination(n, r)
    fact(n, r) / fact(r)
  end

  def fact(n, start = 1)
    n.zero? ? 1 : (start..n).reduce(:*)
  end
  # rubocop:enable Naming/UncommunicativeMethodParamName
end
