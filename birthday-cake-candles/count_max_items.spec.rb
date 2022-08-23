require 'test/unit'
require_relative './count_max_items.rb'
require_relative '../_utils/array/array.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Solutions
    class CountMaxItemsTest < Test::Unit::TestCase

      include ArrayUtils

      def test_raises_an_exception_if_arr_is_smaller_than_1_and_the_allow_unconstrained_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS"] = "disabled"

        assert_raises HackerRank::Exceptions::ArrayOutOfConstraintsException do
          Solutions.count_max_items(arr: create_array_of_random_integers(size: 0))
        end
      end

      def test_raises_an_exception_if_arr_is_greater_than_100_000_and_the_allow_unconstrained_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS"] = "disabled"

        assert_raises HackerRank::Exceptions::ArrayOutOfConstraintsException do
          Solutions.count_max_items(arr: create_array_of_random_integers(size: 100001))
        end
      end

      def test_counts_a_single_tallest_item
        arr = [1, 2, 3, 4]
        assert_equal 1, Solutions.count_max_items(arr: arr)
      end

      def test_counts_multiple_tallest_items
        arr = [1, 2, 4, 4, 3]
        assert_equal 2, Solutions.count_max_items(arr: arr)
      end
    end
  end
end