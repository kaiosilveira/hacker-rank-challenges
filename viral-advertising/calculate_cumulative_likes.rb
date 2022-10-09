require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    INITIAL_COHORT = 5

    def self.calculate_cumulative_likes_for_nth_day(n:)
      raise InputOutOfConstraintsException.new(
        input_name: "n",
        constraints: "1 <= n <= 50"
      ) if (n < 1 || n > 50) && ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

      like_count = 0
      new_people_reached = INITIAL_COHORT
      1.upto(n) do
        new_likes = (new_people_reached / 2).floor
        like_count += new_likes
        new_people_reached = 3 * new_likes
      end

      like_count
    end
  end
end
