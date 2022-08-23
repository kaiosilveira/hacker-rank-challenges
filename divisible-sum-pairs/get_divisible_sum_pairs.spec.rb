require 'test/unit'
require_relative './get_divisible_sum_pairs.rb'

module HackerRank
  module Algorithms
    class GetDivisibleSumPairsTest < Test::Unit::TestCase
      def test_returns_the_correct_results_for_a_given_set
        k = 3
        arr = [1, 3, 2, 6, 1, 2]
        expected_result = 5

        result = HackerRank::Algorithms.get_divisible_sum_pairs(arr: arr, k: k)

        assert_equal expected_result, result
      end
    end
  end
end
