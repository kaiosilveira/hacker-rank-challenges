require 'test/unit'
require_relative './simple-array-sum.rb'

class SimpleArraySumTest < Test::Unit::TestCase

  def test_returns_zero_when_array_is_empty
    arr = []
    assert_equal 0, simple_array_sum(arr)
  end

  def test_resturns_the_correct_sum_for_an_array_of_integers
    arr = [1, 2, 3]
    assert_equal 6, simple_array_sum(arr)
  end

end
