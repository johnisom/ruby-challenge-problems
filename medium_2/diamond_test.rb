# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'diamond'
Minitest::Reporters.use!

# test suite
class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e # rubocop:disable Metrics/MethodLength
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end
