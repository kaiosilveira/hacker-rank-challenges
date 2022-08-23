require_relative './count_max_items.rb'

module HackerRank
  module Challenges
    def self.birthday_cake_candles(arr)
      HackerRank::Algorithms.count_max_items(arr: arr)
    end
  end
end
