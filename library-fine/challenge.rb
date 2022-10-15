require_relative './algorithm.rb'

module HackerRank
  module Challenges
    def self.library_fine(d1, m1, y1, d2, m2, y2)
      Algorithms.calculate_library_fine(expected_date: [d1, m1, y1], date_returned: [d2, m2, y2])
    end
  end
end
