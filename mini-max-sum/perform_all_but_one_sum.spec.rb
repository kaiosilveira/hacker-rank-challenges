require 'test/unit'
require_relative './perform_all_but_one_sum.rb'
require_relative '../_utils/array/array.rb'

module HackerRank
  module Challenges
    class PerformAllButOneSumTest < Test::Unit::TestCase
      include ArrayUtils

      def teardown
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = 'disabled'
      end

      def test_raises_exception_if_array_has_more_than_5_items_and_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = 'disabled'

        exception = Exceptions::InputOutOfConstraintsException.new(
          input_name: 'numbers',
          constraints: '1 <= numbers.size <= 5'
        )

        assert_raises exception do
          Algorithms.perform_all_but_one_sum(
            numbers: create_array_of_random_integers(size: 5),
            number_to_exclude: 1
          )
        end
      end

      def test_executes_if_array_has_more_than_5_items_and_flag_is_enabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = 'enabled'
        assert Algorithms.perform_all_but_one_sum(
          numbers: create_array_of_random_integers(size: 5),
          number_to_exclude: 1
        )
      end

      def test_returns_the_sum_of_all_items_except_the_indicated_one
        numbers = [1, 0, 0, 0, 2]
        number_to_exclude = 2
        assert_equal 1, Algorithms.perform_all_but_one_sum(
          numbers: numbers, number_to_exclude: number_to_exclude
        )
      end
    end
  end
end