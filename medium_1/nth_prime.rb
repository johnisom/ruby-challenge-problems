# frozen_string_literal: true

# monkey patch for prime
class Prime
  class << self
    def nth(nth_prime)
      raise ArgumentError, 'argument not in range (1..nil)' if nth_prime < 1
      return 2 if nth_prime == 1

      current_nth = 2
      test_num = 3
      until current_nth == nth_prime
        test_num += 2
        current_nth += 1 if prime_num?(test_num)
      end
      test_num
    end

    def prime_num?(number)
      (2..number**0.5).none? { |num| (number % num).zero? }
    end
  end
end
