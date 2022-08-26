require 'test/unit'
require_relative './array_sum.rb'
require_relative '../_utils/exceptions/exceptions.rb'
require_relative '../_utils/array/array.rb'

module HackerRank
  module Algorithms
    class SimpleArraySumTest < Test::Unit::TestCase
      include ArrayUtils

      def test_raises_exception_if_the_input_array_has_more_than_10_000_items_and_the_constrain_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "disabled"
        arr = create_array_of_random_integers(size: 10_001)
        array_out_of_constraints_exception = HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'array',
          constraints: '1 <= array.size <= 10_000'
        )

        assert_raises array_out_of_constraints_exception do
          Algorithms.array_sum(arr)
        end
      end

      def test_executes_with_large_array_if_unconstrained_arrays_are_allowed
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"
        arr = create_array_of_random_integers(size: 10_001)
        assert Algorithms.array_sum(arr)
      end

      def test_returns_zero_when_array_is_empty
        arr = []
        assert_equal 0, Algorithms.array_sum(arr)
      end

      def test_returns_the_correct_sum_for_an_array_of_integers
        arr = [1, 2, 3]
        assert_equal 6, Algorithms.array_sum(arr)
      end

    end
  end
end