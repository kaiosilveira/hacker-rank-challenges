require 'test/unit'
require_relative './find_indexes.rb'
require_relative '../_utils/array/array.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class ClassName < Test::Unit::TestCase
      include ArrayUtils

      def setup
        @lookup_array_out_of_constraints_exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'lookup_array',
          constraints: '1 <= lookup_array.size <= 100_000'
        )

        @array_to_iterate_out_of_constraints_exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'array_to_iterate',
          constraints: '1 <= array_to_iterate.size <= 100_000'
        )
      end

      def test_raises_exception_if_lookup_array_has_less_than_one_item_and_flag_is_disabled
        assert_raises @lookup_array_out_of_constraints_exception do
          Algorithms.find_indexes(
            lookup_arr: create_array_of_random_integers(size: 0),
            array_to_iterate: create_array_of_random_integers(size: 100)
          )
        end
      end

      def test_raises_exception_if_lookup_array_has_more_than_100_000_items_and_flag_is_disabled
        assert_raises @lookup_array_out_of_constraints_exception do
          Algorithms.find_indexes(
            lookup_arr: create_array_of_random_integers(size: 100_001),
            array_to_iterate: create_array_of_random_integers(size: 100)
          )
        end
      end

      def test_raises_exception_if_array_to_iterate_has_less_than_one_item_and_flag_is_disabled
        assert_raises @array_to_iterate_out_of_constraints_exception do
          Algorithms.find_indexes(
            lookup_arr: create_array_of_random_integers(size: 100),
            array_to_iterate: create_array_of_random_integers(size: 0)
          )
        end
      end

      def test_raises_exception_if_array_to_iterate_has_more_than_100_000_items_and_flag_is_disabled
        assert_raises @array_to_iterate_out_of_constraints_exception do
          Algorithms.find_indexes(
            lookup_arr: create_array_of_random_integers(size: 100),
            array_to_iterate: create_array_of_random_integers(size: 100_001)
          )
        end
      end

      def test_finds_the_correct_indexes
        lookup_arr = [100, 90, 90, 80, 70, 60, 60, 50]
        array_to_iterate = [105, 95, 85, 75, 65, 59, 50, 49]
        expected_indexes = [0, 1, 2, 3, 4, 5, 5, 6]

        indexes = Algorithms.find_indexes(
          lookup_arr: lookup_arr,
          array_to_iterate: array_to_iterate
        )

        assert_equal expected_indexes, indexes
      end

      def test_uses_one_based_indexes_if_flag_is_specified
        lookup_arr = [100, 90]
        array_to_iterate = [105, 95]
        expected_indexes = [1, 2]

        indexes = Algorithms.find_indexes(
          lookup_arr: lookup_arr,
          array_to_iterate: array_to_iterate,
          use_zero_based_indexes: false
        )

        assert_equal expected_indexes, indexes
      end
    end
  end
end