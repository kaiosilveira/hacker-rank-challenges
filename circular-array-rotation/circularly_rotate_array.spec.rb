require "test/unit"
require_relative "./circularly_rotate_array.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class CircularlyRotateArrayTests < AlgorithmTest
      def test_return_a_clone_of_the_original_input
        original_input = [5, 3, 4]
        Algorithms.circularly_rotate_array(input: [3, 4, 5])
        assert_equal [5, 3, 4], original_input
      end

      def test_moves_the_last_element_to_the_first_position
        assert_equal [5, 3, 4], Algorithms.circularly_rotate_array(input: [3, 4, 5])
      end

      def test_moves_the_last_element_to_the_first_position_multiple_times
        assert_equal [4, 5, 3], Algorithms.circularly_rotate_array(input: [3, 4, 5], rotations: 2)
      end
    end
  end
end
