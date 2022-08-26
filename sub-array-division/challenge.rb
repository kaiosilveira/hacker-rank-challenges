require_relative './select_chocolate_slices_matching_criteria.rb'

module HackerRank
  module Challenges
    def self.birthday(d, m, arr)
      Algorithms.select_chocolate_slices_matching_criteria(
        birth_day: d,
        birth_month: m,
        chocolate: arr
      )
    end
  end
end
