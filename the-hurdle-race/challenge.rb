require_relative './algorithm.rb'

module HackerRank
  module Challenges
    def self.challenge_name(args)
      Algorithms.algorithm_name(args: [])
    end
  end
end
