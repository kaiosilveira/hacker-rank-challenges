require "test/unit"
require_relative "./count_beautiful_days.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class CountBeautifulDaysTests < Test::Unit::TestCase
      include HackerRank::Exceptions

      def test_raises_an_exception_if_day0_is_lower_than_1
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 0, dayN: 1, divisor: 2)
        end
      end

      def test_raises_an_exception_if_dayN_is_lower_than_1
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 1, dayN: 0, divisor: 2)
        end
      end

      def test_raises_an_exception_if_day0_is_greater_than_dayN
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 2, dayN: 1, divisor: 2)
        end
      end

      def test_raises_an_exception_if_day0_is_greater_than_2_000_000
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 2_000_002, dayN: 2_000_000, divisor: 2)
        end
      end

      def test_raises_an_exception_if_dayN_is_greater_than_2_000_000
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 2_000_000, dayN: 2_000_002, divisor: 2)
        end
      end

      def test_raises_an_exception_if_divisor_is_lower_than_1
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 20, dayN: 23, divisor: 0)
        end
      end

      def test_raises_an_exception_if_divisor_is_greater_than_2_000_000_000
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.count_beautiful_days(day0: 20, dayN: 23, divisor: 2_000_000_001)
        end
      end

      def test_identifies_beautiful_days_correctly
        assert_equal 2, Algorithms.count_beautiful_days(day0: 20, dayN: 23, divisor: 6)
      end
    end
  end
end
