require 'test/unit'
require_relative './get_closest_or_default.rb'

module HackerRank
  module Algorithms
    class GetClosestOrDefaultTest < Test::Unit::TestCase
      def test_item_A_is_the_closest
        itemA = { position: 3, label: 'Item A' }
        itemB = { position: 4, label: 'Item B' }
        target = { position: 2, label: 'Target C' }
        expected_result = 'Item A'

        assert_equal expected_result, Algorithms.get_closest_or_default(
          itemA: itemA, itemB: itemB, target: target
        )
      end

      def test_item_B_is_the_closest
        itemA = { position: 2, label: 'Item A' }
        itemB = { position: 5, label: 'Item B' }
        target = { position: 4, label: 'Target C' }
        expected_result = 'Item B'

        assert_equal expected_result, Algorithms.get_closest_or_default(
          itemA: itemA, itemB: itemB, target: target
        )
      end

      def test_defaults_to_target
        itemA = { position: 2, label: 'Item A' }
        itemB = { position: 2, label: 'Item B' }
        target = { position: 4, label: 'Target C' }
        expected_result = 'Target C'

        assert_equal expected_result, Algorithms.get_closest_or_default(
          itemA: itemA, itemB: itemB, target: target
        )
      end
    end
  end
end