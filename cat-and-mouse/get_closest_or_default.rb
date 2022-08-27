module HackerRank
  module Algorithms
    def self.get_closest_or_default(itemA:, itemB:, target:)
      item_a_distance = (target[:position] - itemA[:position]).abs
      item_b_distance = (target[:position] - itemB[:position]).abs

      return itemA[:label] if item_a_distance < item_b_distance
      return itemB[:label] if item_b_distance < item_a_distance

      target[:label]
    end
  end
end
