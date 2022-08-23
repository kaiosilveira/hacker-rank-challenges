module HackerRank
  module Algorithms

    def self.validate_bill_division(
      bill_items:,
      index_of_item_anna_refused_to_eat:,
      bill_division_according_to_brian:
    )
      partial_brian = bill_items.delete_at(index_of_item_anna_refused_to_eat)
      total_price_of_shared_items = bill_items.reduce(&:+)
      total_shared_price_for_each_person = total_price_of_shared_items / 2
      total_brian = total_shared_price_for_each_person + partial_brian

      if bill_division_according_to_brian == total_shared_price_for_each_person
        return "Bon Appetit"
      else
        return (bill_division_according_to_brian - total_shared_price_for_each_person).abs
      end
    end

  end
end
