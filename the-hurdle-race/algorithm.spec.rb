require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class AlgorithmTests < Test::Unit::TestCase
      include HackerRank::Exceptions

      def test_applies_the_pattern_correctly
        assert_equal 2, Algorithms.get_difference_to_highest_item(
          initial_height: 1,
          heights: [1, 2, 3, 3, 2]
        )
        assert_equal 2, Algorithms.get_difference_to_highest_item(
          initial_height: 4,
          heights: [1, 6, 3, 5, 2]
        )
        assert_equal 0, Algorithms.get_difference_to_highest_item(
          initial_height: 7,
          heights: [2, 5, 4, 5, 2]
        )
      end
    end
  end
end
