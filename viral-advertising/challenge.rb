require_relative './calculate_cumulative_likes.rb'

module HackerRank
  module Challenges
    def self.viral_advertising(n)
      HackerRank::Algorithms.calculate_cumulative_likes_for_nth_day(n: n)
    end
  end
end
