require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/algorithm-test/index.rb"

module HackerRank
  module Algorithms
    class FindLongestSubArrayTests < AlgorithmTest
      def test_raises_an_exception_if_input_arr_size_is_lower_than_1
        empty_arr = create_array_of_random_integers(size: 0, item_max: 100)
        assert_raises_arr_out_of_min_size &-> { Algorithms.find_longest_sub_array(input_arr: empty_arr) }
      end

      def test_raises_an_exception_if_input_arr_size_is_greater_than_100_and_ctt_v8n_is_enabled
        large_array = create_array_of_random_integers(size: 101, item_max: 100)
        assert_raises_arr_out_of_max_size &-> { Algorithms.find_longest_sub_array(input_arr: large_array) }
      end

      def test_does_not_raise_an_exp_if_input_arr_size_is_greater_than_100_and_ctt_v8n_is_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        large_array = create_array_of_random_integers(size: 101, item_max: 100)
        Algorithms.find_longest_sub_array(input_arr: large_array)
      end

      def test_applies_the_pattern_correctly
        assert_equal 5, Algorithms.find_longest_sub_array(input_arr: [1, 1, 2, 2, 4, 4, 5, 5, 5])
        assert_equal 3, Algorithms.find_longest_sub_array(input_arr: [4, 6, 5, 3, 3, 1])
        assert_equal 5, Algorithms.find_longest_sub_array(input_arr: [1, 2, 2, 3, 1, 2])
      end
    end
  end
end
