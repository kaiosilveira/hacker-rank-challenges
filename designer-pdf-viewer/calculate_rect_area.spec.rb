require "test/unit"
require_relative "./calculate_rect_area.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class CalculateRectAreaTests < Test::Unit::TestCase
      include HackerRank::Exceptions

      def setup
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        @char_heights = [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 1, 1, 5, 5, 1, 5, 2, 5, 5, 5, 5, 5, 5]
      end

      def teardown
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
      end

      def test_raises_ex_if_char_heights_does_not_contain_26_items
        assert_raises InputOutOfConstraintsException do
          Algorithms.calculate_rect_area(char_heights: [5], word: "test")
        end
      end

      def test_raises_ex_if_any_height_is_lower_than_1_and_constraint_enforcement_is_enabled
        char_heights = @char_heights
        char_heights[0] = [0]
        assert_raises InputOutOfConstraintsException do
          Algorithms.calculate_rect_area(char_heights: [0], word: "test")
        end
      end

      def test_raises_ex_if_any_height_is_lower_greater_than_7_and_constraint_enforcement_is_enabled
        char_heights = @char_heights
        char_heights[0] = 8
        assert_raises InputOutOfConstraintsException do
          Algorithms.calculate_rect_area(char_heights: [8], word: "test")
        end
      end

      def test_applies_the_pattern_correctly
        char_heights = @char_heights
        assert_equal 8, Algorithms.calculate_rect_area(char_heights: char_heights, word: "torn")
      end
    end
  end
end
