# frozen_string_literal: true

# matrix saddle point class
class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = str.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index.with_object([]) do |(row, r_idx), result|
      row.each_with_index do |value, c_idx|
        col = columns[c_idx]
        result << [r_idx, c_idx] if value == col.min && value == row.max
      end
    end
  end
end

#     0  1  2
#   |---------
# 0 | 9  8  7
# 1 | 5  5  2
# 2 | 6  6  7

# I need to go thru each row, and with each column add r_idx and c_idx to the result if
# the column is the max in the row and the row is the min in the column
