# frozen_string_literal: true

# dna class
class DNA
  def initialize(sequence)
    @sequence = sequence.chars
  end

  def hamming_distance(other_sequence)
    short, long = [@sequence, other_sequence.chars].sort_by(&:size)
    count = 0
    short.each_with_index { |chr, idx| count += 1 unless chr == long[idx] }
    count
  end
end
