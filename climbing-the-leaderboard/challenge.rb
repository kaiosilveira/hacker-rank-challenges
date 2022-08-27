require_relative './find_indexes.rb'

module HackerRank
  module Challenges
    def self.climbing_leaderboard(ranked, player)
      HackerRank::Algorithms.find_indexes(
        lookup_arr: ranked,
        array_to_iterate: player,
        use_zero_based_indexes: false
      )
    end
  end
end
