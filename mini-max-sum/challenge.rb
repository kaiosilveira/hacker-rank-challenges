require_relative './perform_all_but_one_sum.rb'

module HackerRank
  module Challenges
    def self.mini_max_sum(arr)
      min = Algorithms.perform_all_but_one_sum(numbers: arr, number_to_exclude: arr.max)
      max = Algorithms.perform_all_but_one_sum(numbers: arr, number_to_exclude: arr.min)
      result = "#{min} #{max}"
      puts result
      result
    end
  end
end
