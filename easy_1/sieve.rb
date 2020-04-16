# frozen_string_literal: true

require 'pry'

# sieve class for challenge
class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    num_arr = (2..@limit).to_a
    p = 2
    until p**2 > @limit
      (p**2..@limit).step(p) do |i|
        num_arr[i - 2] = nil
      end
      p = num_arr.compact[num_arr.compact.index(p) + 1]
    end
    num_arr.compact
  end
end
