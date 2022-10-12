require 'test/unit'

module HackerRank
  module Algorithms
    def self.count_letters_a_in_sequence(pattern:, sequence_length:)
      repetitions = sequence_length / pattern.size
      rest = sequence_length % pattern.size
      total_for_repetitions = repetitions * pattern.chars.count{ |c| c == 'a' }
      total_for_remainder = pattern[0, rest].chars.count { |c| c == 'a' }
      total_for_repetitions + total_for_remainder
    end

    class RepeatedStringTests < Test::Unit::TestCase
      def test_works
        assert_equal 4, Algorithms.count_letters_a_in_sequence(pattern: 'abcab', sequence_length: 10)
      end

      def test_works_2
        assert_equal 4, Algorithms.count_letters_a_in_sequence(pattern: 'abcabc', sequence_length: 10)
      end

      def test_does_not_explode
        assert_equal 1000000000000, Algorithms.count_letters_a_in_sequence(
          pattern: 'a',
          sequence_length: 1000000000000
        )
      end
    end
  end
end