require 'test/unit'
require_relative './select_chocolate_slices_matching_criteria.rb'
require_relative '../_utils/array/array.rb'

module HackerRank
  module Algorithms
    class SelectChocolateSlicesMatchingCriteriaTest < Test::Unit::TestCase
      include ArrayUtils
      include HackerRank::Exceptions

      def test_returns_zero_if_chocolate_array_is_empty
        result = Algorithms.select_chocolate_slices_matching_criteria(
          birth_day: 1, birth_month: 1, chocolate: []
        )

        assert_equal 0, result
      end

      def test_raises_an_exception_if_birth_day_is_smaller_than_one
        assert_raises InvalidDayOfMonthException do
          Algorithms.select_chocolate_slices_matching_criteria(
            birth_day: 0, birth_month: 1, chocolate: [1, 2]
          )
        end
      end

      def test_raises_an_exception_if_birth_day_is_greater_than_thirty_one
        assert_raises InvalidDayOfMonthException do
          Algorithms.select_chocolate_slices_matching_criteria(
            birth_day: 32, birth_month: 1, chocolate: [1, 2]
          )
        end
      end

      def test_raises_an_exception_if_birth_month_is_smaller_than_one
        assert_raises InvalidMonthOfYearException do
          Algorithms.select_chocolate_slices_matching_criteria(
            birth_day: 15, birth_month: 0, chocolate: [1, 2]
          )
        end
      end

      def test_raises_an_exception_if_birth_month_is_greater_than_twelve
        assert_raises InvalidMonthOfYearException do
          Algorithms.select_chocolate_slices_matching_criteria(
            birth_day: 15, birth_month: 13, chocolate: [1, 2]
          )
        end
      end

      def test_raises_an_exception_if_array_size_is_greater_than_100_and_the_constrain_flag_is_disabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "disabled"
        assert_raises PossiblyUnboundArrayException do
          Algorithms.select_chocolate_slices_matching_criteria(
            birth_day: 15,
            birth_month: 10,
            chocolate: create_array_of_random_integers(size: 101)
          )
        end
      end

      def test_executes_if_array_length_is_greater_than_100_and_the_constrain_flag_is_enabled
        ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"
        Algorithms.select_chocolate_slices_matching_criteria(
          birth_day: 15,
          birth_month: 10,
          chocolate: create_array_of_random_integers(size: 101)
        )
      end
    end
  end
end