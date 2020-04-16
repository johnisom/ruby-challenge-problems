# frozen_string_literal: true

# Series class for challenge
class Series
  def initialize(num)
    @num = num
  end

  def slices(slice_num)
    raise ArgumentError, 'slice out of range' if slice_num > @num.size

    @num.each_char.each_cons(slice_num).map { |arr| arr.map(&:to_i) }
  end
end
