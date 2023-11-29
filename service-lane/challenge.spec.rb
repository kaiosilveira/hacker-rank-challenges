require "test/unit"
require_relative "./challenge.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Challenges
    class ServiceLaneTests < Algorithms::AlgorithmTest
      def test_raises_exception_if_input_is_not_an_array
        assert_raises_invalid_type &-> {
          Challenges.service_lane(input: 3, cases: [1, 2])
        }
      end

      def test_raises_exception_if_input_array_size_is_smaller_than_the_lower_end_constraint
        assert_raises_arr_out_of_min_size &-> {
          Challenges.service_lane(input: [1], cases: [1, 2])
        }
      end

      def test_raises_exception_if_input_array_size_is_greater_than_the_higher_end_constraint
        assert_raises_arr_out_of_max_size &-> {
          Challenges.service_lane(
            input: create_array_of_random_integers(size: 10**4 + 1),
            cases: [1, 2]
          )
        }
      end

      def test_raises_exception_if_cases_is_not_an_array
        assert_raises_invalid_type &-> {
          Challenges.service_lane(input: [1, 2, 3, 2], cases: 42)
        }
      end

      def test_raises_exception_if_cases_size_is_smaller_than_the_lower_end_constraint
        assert_raises_arr_out_of_min_size &-> {
          Challenges.service_lane(input: [1, 2, 3, 2], cases: [])
        }
      end

      def test_raises_exception_if_cases_size_is_greater_than_the_higher_end_constraint
        assert_raises_arr_out_of_max_size &-> {
          Challenges.service_lane(
            input: [1, 2, 3, 2],
            cases: create_array_of_random_integers(size: 1000 + 1)
          )
        }
      end
    end
  end
end
