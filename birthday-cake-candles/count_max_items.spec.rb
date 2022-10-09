require 'test/unit'
require_relative './count_max_items.rb'
require_relative '../_utils/array/array.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class CountMaxItemsTest < Test::Unit::TestCase

      include ArrayUtils

      def test_raises_an_exception_if_arr_is_smaller_than_1_and_constraints_are_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises HackerRank::Exceptions::InputOutOfConstraintsException do
          Algorithms.count_max_items(arr: create_array_of_random_integers(size: 0))
        end
      end

      def test_does_not_raise_an_exception_if_arr_is_smaller_than_1_and_constraints_are_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.count_max_items(arr: create_array_of_random_integers(size: 0))
      end

      def test_raises_an_exception_if_arr_is_greater_than_100_000_and_constraints_are_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises HackerRank::Exceptions::InputOutOfConstraintsException do
          Algorithms.count_max_items(arr: create_array_of_random_integers(size: 100001))
        end
      end

      def test_does_not_raise_an_exception_if_arr_is_greater_than_100_000_and_constraints_are_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.count_max_items(arr: create_array_of_random_integers(size: 100001))
      end

      def test_counts_a_single_tallest_item
        arr = [1, 2, 3, 4]
        assert_equal 1, Algorithms.count_max_items(arr: arr)
      end

      def test_counts_multiple_tallest_items
        arr = [1, 2, 4, 4, 3]
        assert_equal 2, Algorithms.count_max_items(arr: arr)
      end
    end
  end
end