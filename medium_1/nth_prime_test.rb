# frozen_string_literal: true

require 'prime'

ERROR_MESSAGE = <<~MSG
  Using Ruby's Prime class is probably the best way to do this in a
  'real' application; but this is an exercise, not a real application,
  so you're expected to implement this yourself.
MSG

# This code prevents you from using any of the prohibited methods.

# monkey patch 1
class Prime
  %i[each new prime? take].each do |m|
    define_method(m) { |*_| raise ERROR_MESSAGE }
  end
end

# monkey patch 2
class Integer
  %i[prime? each_prime].each do |m|
    define_method(m) { |*_| raise ERROR_MESSAGE }
  end
end

# Actual test suite begins here.

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'nth_prime'
Minitest::Reporters.use!

# test suite
class TestPrimes < Minitest::Test
  def test_first
    assert_equal 2, Prime.nth(1)
  end

  def test_second
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    assert_equal 13, Prime.nth(6)
  end

  def test_big_prime
    assert_equal 104_743, Prime.nth(10_001)
  end

  def test_weird_case
    assert_raises ArgumentError do
      Prime.nth(0)
    end
  end
end
