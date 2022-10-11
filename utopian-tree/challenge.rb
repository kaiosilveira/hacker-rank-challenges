require_relative './calculate_utopian_tree_height.rb'

module HackerRank
  module Challenges
    def self.utopian_tree(n)
      Algorithms.calculate_utopian_tree_height(number_of_cycles: n)
    end
  end
end
