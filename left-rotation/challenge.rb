require_relative './perform_left_rotation.rb'

module HackerRank
  module Challenges
    def self.left_rotation(d, arr)
      HackerRank::Algorithms.perform_left_rotation(offset: d, array: arr)
    end
  end
end
