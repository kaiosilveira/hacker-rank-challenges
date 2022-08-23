require "test/unit"
require_relative "./validate_bill_division.rb"

module HackerRank
  module Algorithms

    class ValidateBillDivisionTest < Test::Unit::TestCase
      def test_returns_bon_appetit_if_bill_is_correctly_split
        result = Algorithms.validate_bill_division(
          bill_items: [2, 4, 6],
          index_of_item_anna_refused_to_eat: 2,
          bill_division_according_to_brian: 3
        )

        assert_equal "Bon Appetit", result
      end

      def test_returns_the_amount_owed_if_bill_is_incorrectly_split
        result = Algorithms.validate_bill_division(
          bill_items: [3, 10, 2, 9],
          index_of_item_anna_refused_to_eat: 1,
          bill_division_according_to_brian: 12
        )

        assert_equal 5, result
      end
    end

  end
end
