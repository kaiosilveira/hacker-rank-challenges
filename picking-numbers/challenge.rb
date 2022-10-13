require_relative './algorithm.rb'

module HackerRank
  module Challenges
    def self.picking_numbers(arr)
      Algorithms.find_longest_sub_array(input_arr: arr)
    end
  end
end
