require_relative './get_divisible_sum_pairs.rb'

module HackerRank
  module Challenges
    def self.divisible_sum_pairs(n, k, arr)
      HackerRank::Algorithms.get_divisible_sum_pairs(arr: arr, k: k)
    end
  end
end
