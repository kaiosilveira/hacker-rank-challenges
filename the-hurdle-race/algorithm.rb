require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.get_difference_to_highest_item(initial_height:, heights:)
      tallest_item = heights.max
      diff = initial_height - tallest_item
      diff < 0 ? diff.abs : 0
    end
  end
end
