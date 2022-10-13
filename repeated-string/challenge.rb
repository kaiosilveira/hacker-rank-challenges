require_relative './algorithm.rb'

module HackerRank
  module Challenges
    def self.repeated_string(pattern, sequence_length)
      Algorithms.count_letters_a_in_sequence(
        pattern: pattern,
        sequence_length: sequence_length
      )
    end
  end
end
