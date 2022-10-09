require 'test/unit'
require_relative './calculate_cumulative_likes'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class CalculateCumulativeLikesForNthDayTests < Test::Unit::TestCase
      include HackerRank::Exceptions

      def test_raises_an_exception_if_nth_day_is_lower_than_1_and_constraint_enforcement_is_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises InputOutOfConstraintsException do
          Algorithms.calculate_cumulative_likes_for_nth_day(n: 0)
        end
      end

      def test_does_not_raise_an_exception_nth_day_is_lower_than_1_and_constraint_enforcement_is_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.calculate_cumulative_likes_for_nth_day(n: 0)
      end

      def test_raises_an_exception_if_nth_day_is_greater_than_50_and_constraint_enforcement_is_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises InputOutOfConstraintsException do
          Algorithms.calculate_cumulative_likes_for_nth_day(n: 51)
        end
      end

      def test_does_not_raise_an_exception_nth_day_is_greater_than_50_and_constraint_enforcement_is_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.calculate_cumulative_likes_for_nth_day(n: 51)
      end

      def test_replicates_the_pattern_correctly
        assert_equal (5 / 2).floor, Algorithms.calculate_cumulative_likes_for_nth_day(n: 1)
        assert_equal 24, Algorithms.calculate_cumulative_likes_for_nth_day(n: 5)
      end
    end
  end
end
