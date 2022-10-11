require 'test/unit'
require_relative './calculate_utopian_tree_height.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Challenges
    include HackerRank::Exceptions

    class UtopianTreeTests < Test::Unit::TestCase
      def teardown
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
      end

      def test_raises_an_exception_if_number_of_cycles_is_lower_than_1
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.calculate_utopian_tree_height(number_of_cycles: 0)
        end
      end

      def test_raises_an_exception_if_number_of_cycles_is_greater_than_60_and_constraint_enforcement_is_enabled
        assert_raises Exceptions::InputOutOfConstraintsException do
          Algorithms.calculate_utopian_tree_height(number_of_cycles: 61)
        end
      end

      def test_does_not_raise_an_exception_if_number_of_cycles_is_greater_than_60_and_constraint_enforcement_is_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.calculate_utopian_tree_height(number_of_cycles: 61)
      end

      def test_applies_the_growth_pattern_correctly
        assert_equal 2, Algorithms.calculate_utopian_tree_height(number_of_cycles: 1)
        assert_equal 3, Algorithms.calculate_utopian_tree_height(number_of_cycles: 2)
        assert_equal 6, Algorithms.calculate_utopian_tree_height(number_of_cycles: 3)
        assert_equal 7, Algorithms.calculate_utopian_tree_height(number_of_cycles: 4)
        assert_equal 14, Algorithms.calculate_utopian_tree_height(number_of_cycles: 5)
      end
    end
  end
end
