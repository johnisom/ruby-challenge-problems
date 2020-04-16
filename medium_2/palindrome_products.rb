# frozen_string_literal: true

# palindromic number class
class Palindrome
  attr_reader :value, :factors

  def initialize(value)
    @value = value
    @factors = []
  end

  def <<(factor_pair)
    @factors << factor_pair
  end
end

# palindromes class
class Palindromes
  def initialize(max_factor: 1, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = Hash.new { |hsh, key| hsh[key] = Palindrome.new(key) }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |fact1, fact2|
      product = fact1 * fact2
      @palindromes[product] << [fact1, fact2] if palindrome?(product)
    end
  end

  def largest
    @palindromes.values.max_by(&:value)
  end

  def smallest
    @palindromes.values.min_by(&:value)
  end

  private

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end

# rubocop:disable Metrics/LineLength

# PEDAC

# Problem: Create numeric palindromes from a product of 2 factors, where
#          the min and max factors are passed in as keyword arguments to
#          the Palindromes::new method. Each palindrome generated with
#          Palindromes#generate will have a value and the factors used to
#          generate it

# Examples & test cases are taken care of in palindrome_product_test.rb

# Data structures: Have 2 instance variables for max and min factors that
#                  control generation of palindrome numbers.
#                  There will be an instance variable hash that is populated
#                  with palindromic numbers when Palindromes#generate is called.
#                  Have a Palindrome class that will have instance variables
#                  for value and factors, which are attr_reader-ified. They are set
#                  when initialized via passed in arguments.

# Algorithm: Palindromes#largest will take the max value of the internal hash using
#            Hash#values then calling Enumerable#max_by on the result.
#            Palindromes#smallest will do the same but with Enumerable#min_by.
#            Palindromes#generate is the tricky one. It will iterate from @min_factor to
#            @max_factor nested and test to see if the product of nested iteration is a palindrome.
#            Example of iteration with min_factor being 1 and max_factor being 5
#            fact1: 1, fact2: 1
#            fact1: 1, fact2: 2
#            fact1: 1, fact2: 3
#            fact1: 1, fact2: 4
#            fact1: 1, fact2: 5
#            fact1: 2, fact2 iterates from 2 to 5
#            fact1: 3, fact2 iterates from 3 to 5
#            fact1: 4, fact2 iterates from 4 to 5
#            fact1: 5, fact2 iterates from 5 to 5
#            If private method Palindromes#palindrome?(fact1 * fact2) returns
#            true, create a palindromic number with the product of nested iteration and
#            those 2 factors and add it to the internal hash (key is product, value is a
#            new palindromic number) if it's not already in the hash. If it is, update the
#            palindromic number's factors to reflect the new ones you just found using
#            Palindrome#<< method.

# rubocop:enable Metrics/LineLength
