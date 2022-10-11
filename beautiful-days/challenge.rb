require_relative './count_beautiful_days.rb'

module HackerRank
  module Challenges
    def self.beautiful_days(i, j, k)
      Algorithms.count_beautiful_days(day0: i, dayN: j, divisor: k)
    end
  end
end
