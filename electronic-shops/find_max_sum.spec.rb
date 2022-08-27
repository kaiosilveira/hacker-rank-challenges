require 'test/unit'
require_relative './find_max_sum.rb'
require_relative '../_utils/array/array.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class FindMaxSumTest < Test::Unit::TestCase
      include ArrayUtils

      def setup
        @limit = 60
        @first_array = [40, 50, 60]
        @second_array = [5, 8, 12]
        @expected_result = 58

        @limit_out_of_constraints_exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'limit',
          constraints: '1 <= limit <= 1_000_000'
        )

        @first_array_out_of_constraints_exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'first_array',
          constraints: '1 <= first_array.size <= 1000'
        )

        @second_array_out_of_constraints_exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'second_array',
          constraints: '1 <= second_array.size <= 1000'
        )
      end

      def teardown
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "disabled"
      end

      def test_raises_exception_if_first_array_has_more_than_1000_items_and_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "disabled"
        first_array = create_array_of_random_integers(size: 1001)
        assert_raises @first_array_out_of_constraints_exception do
          Algorithms.find_max_sum(
            limit: @limit, first_array: first_array, second_array: @second_array
          )
        end
      end

      def test_executes_if_first_array_has_more_than_1000_items_and_flag_is_enabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"
        first_array = create_array_of_random_integers(size: 1001)
        assert Algorithms.find_max_sum(
          limit: @limit,
          first_array: first_array,
          second_array: @second_array
        )
      end

      def test_raises_exception_if_second_array_has_more_than_1000_items_and_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "disabled"
        second_array = create_array_of_random_integers(size: 1001)
        assert_raises @second_array_out_of_constraints_exception do
          Algorithms.find_max_sum(
            limit: @limit, first_array: @first_array, second_array: second_array
          )
        end
      end

      def test_executes_if_second_array_has_more_than_1000_items_and_flag_is_enabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"
        second_array = create_array_of_random_integers(size: 1001)
        assert Algorithms.find_max_sum(
          limit: @limit,
          first_array: @first_array,
          second_array: second_array
        )
      end

      def test_raises_exception_if_limit_is_less_than_1
        limit = 0
        assert_raises @limit_out_of_constraints_exception do
          Algorithms.find_max_sum(
            limit: limit, first_array: @first_array, second_array: @second_array
          )
        end
      end

      def test_raises_exception_if_limit_is_greater_than_1_000_000
        limit = 1_000_001
        assert_raises @limit_out_of_constraints_exception do
          Algorithms.find_max_sum(
            limit: limit, first_array: @first_array, second_array: @second_array
          )
        end
      end

      def test_returns_minus_one_if_impossible_to_select_an_item_from_the_first_array
        limit = 5
        first_array = [10]
        second_array = [1, 2, 3]
        expected_result = -1

        assert_equal expected_result, Algorithms.find_max_sum(
          limit: limit,
          first_array: first_array,
          second_array: second_array
        )
      end

      def test_returns_minus_one_if_select_an_item_from_the_second_array
        limit = 5
        first_array = [1, 2, 3]
        second_array = [10]
        expected_result = -1

        assert_equal expected_result, Algorithms.find_max_sum(
          limit: limit,
          first_array: first_array,
          second_array: second_array
        )
      end

      def test_returns_the_max_possible_sum
        limit = 60
        first_array = [40, 50, 60]
        second_array = [5, 8, 12]
        expected_result = 58

        assert_equal expected_result, Algorithms.find_max_sum(
          limit: limit,
          first_array: first_array,
          second_array: second_array
        )
      end
    end
  end
end