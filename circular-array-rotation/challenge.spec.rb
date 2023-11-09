require "test/unit"
require_relative "./challenge.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Challenges
    class CircularlyRotateArrayTests < Algorithms::AlgorithmTest
      def test_raises_exception_if_input_is_not_an_array
        assert_raises_invalid_type &-> {
          Challenges.circular_array_rotation(input: 3, number_of_rotations: 2, queries: [1, 2])
        }
      end

      def test_raises_exception_if_input_array_size_is_smaller_than_the_lower_end_constraint
        assert_raises_arr_out_of_min_size &-> {
          Challenges.circular_array_rotation(input: [], number_of_rotations: 2, queries: [1, 2])
        }
      end

      def test_raises_exception_if_input_array_size_is_greater_than_the_higher_end_constraint
        assert_raises_arr_out_of_max_size &-> {
          Challenges.circular_array_rotation(
            input: create_array_of_random_integers(size: 10**5 + 1),
            number_of_rotations: 2,
            queries: [1, 2]
          )
        }
      end

      def test_raises_exception_if_number_of_rotations_is_smaller_than_the_lower_end_constraint
        assert_raises_out_of_constraints &-> {
          Challenges.circular_array_rotation(
            input: [3, 4, 5], number_of_rotations: 0, queries: [1, 2]
          )
        }
      end

      def test_raises_exception_if_number_of_rotations_is_greater_than_the_higher_end_constraint
        assert_raises_out_of_constraints &-> {
          Challenges.circular_array_rotation(
            input: [3, 4, 5], number_of_rotations: 10 ** 5 + 1, queries: [1, 2]
          )
        }
      end

      def test_raises_an_exception_if_queries_input_is_not_an_array
        assert_raises_invalid_type &-> {
          Challenges.circular_array_rotation(input: [3, 4, 5], number_of_rotations: 2, queries: 3)
        }
      end

      def test_raises_exception_if_queries_array_size_is_smaller_than_the_lower_end_constraint
        assert_raises_arr_out_of_min_size &-> {
          Challenges.circular_array_rotation(input: [3, 4, 5], number_of_rotations: 2, queries: [])
        }
      end

      def test_raises_exception_if_queries_array_size_is_greater_than_the_higher_end_constraint
        assert_raises_arr_out_of_max_size &-> {
          Challenges.circular_array_rotation(
            input: [3, 4, 5],
            number_of_rotations: 2,
            queries: create_array_of_random_integers(size: 501)
          )
        }
      end
    end
  end
end
