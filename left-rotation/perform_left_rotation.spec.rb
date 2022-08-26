require "test/unit"
require_relative './perform_left_rotation.rb'
require_relative '../_utils/array/array.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class TestLeftRotation < Test::Unit::TestCase
      include ArrayUtils

      def setup
        @offset_out_of_constraints_exception = HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'offset',
          constraints: '1 <= offset <= array.size'
        )

        @array_out_of_constraints_exception = HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'array',
          constraints: '1 <= array.size <= 100_000'
        )
        super
      end

      def test_raises_exception_if_the_offset_value_is_less_than_1
        array = create_array_of_random_integers(size: 10)
        assert_raises @offset_out_of_constraints_exception do
          Algorithms.perform_left_rotation(offset: 0, array: array)
        end
      end

      def test_raises_exception_if_the_offset_value_is_greater_than_array_size
        array = create_array_of_random_integers(size: 10)
        assert_raises @offset_out_of_constraints_exception do
          Algorithms.perform_left_rotation(offset: 11, array: array)
        end
      end

      def test_raises_exception_if_the_input_array_has_more_than_100_000_items
        array = create_array_of_random_integers(size: 100_001)
        assert_raises @array_out_of_constraints_exception do
          Algorithms.perform_left_rotation(offset: 2, array: array)
        end
      end

      def test_raises_exception_if_the_input_array_has_less_than_1_item
        array = create_array_of_random_integers(size: 0)
        assert_raises @array_out_of_constraints_exception do
          Algorithms.perform_left_rotation(offset: 2, array: array)
        end
      end

      def test_shifts_the_elements_d_positions_to_the_left
        array = [1, 2, 3, 4, 5]
        expected_result = [3, 4, 5, 1, 2]
        assert_equal expected_result, Algorithms.perform_left_rotation(offset: 2, array: array)
      end
    end
  end
end
