require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class WasClassCanceledTests < Test::Unit::TestCase
      def test_applies_the_pattern_correctly
        assert_false Algorithms.was_class_canceled?(arrival_times: [-2, -1, 0, 1, 2], threshold: 3)
        assert Algorithms.was_class_canceled?(arrival_times: [-1, -3, 4, 2], threshold: 3)
        assert_false Algorithms.was_class_canceled?(arrival_times: [0, -1, 2, 1], threshold: 2)
      end
    end
  end
end
