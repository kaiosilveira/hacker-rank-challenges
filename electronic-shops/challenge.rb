require_relative './find_max_sum.rb'

module HackerRank
  module Challenges
    def self.get_money_spent(keyboards, drives, budget)
      Algorithms.find_max_sum(limit: budget, first_array: keyboards, second_array: drives)
    end
  end
end
