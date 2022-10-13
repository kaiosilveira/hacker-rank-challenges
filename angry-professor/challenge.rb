require_relative './algorithm.rb'

module HackerRank
  module Challenges
    def self.angry_professor(a, k)
      Algorithms.was_class_canceled?(arrival_times: a, threshold: k) ? 'YES' : 'NO'
    end
  end
end
