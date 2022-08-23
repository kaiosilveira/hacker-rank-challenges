require_relative './validate-bill-division.rb'

module HackerRank
  module Challenges
    def self.bon_appetit(bill, k, b)
      result = HackerRank::Algorithms.validate_bill_division(
        bill_items: bill,
        index_of_item_anna_refused_to_eat: k,
        bill_division_according_to_brian: b
      )

      puts result
      result
    end
  end
end
