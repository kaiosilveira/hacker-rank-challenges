require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class ChallengeAlgorithmTests < AlgorithmTest
      def test_returns_an_empty_result_for_empty_input_arrays
        assert_equal [], Algorithms.find_minimum_values_in_slices(arr: [], slices: [[0, 1]])
      end

      def test_returns_an_empty_result_for_empty_slices
        assert_equal [], Algorithms.find_minimum_values_in_slices(arr: [1, 1], slices: [])
      end

      def test_returns_the_minimum_value_in_slice
        assert_equal [1], Algorithms.find_minimum_values_in_slices(arr: [1, 2], slices: [[0, 1]])
      end

      def test_returns_the_minimum_values_for_multiple_slices
        assert_equal [1, 1], Algorithms.find_minimum_values_in_slices(
          arr: [1, 2, 1, 3], slices: [[0, 1], [2, 3]],
        )
      end
    end
  end
end
