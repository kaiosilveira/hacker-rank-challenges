require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.count_letters_a_in_sequence(pattern:, sequence_length:)
      repetitions = sequence_length / pattern.size
      rest = sequence_length % pattern.size

      total_for_repetitions = repetitions * pattern.chars.count { |c| c == "a" }
      total_for_remainder = pattern[0, rest].chars.count { |c| c == "a" }

      total_for_repetitions + total_for_remainder
    end
  end
end
