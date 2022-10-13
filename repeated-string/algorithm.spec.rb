require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class CountLettersAInSequenceTests < Test::Unit::TestCase
      def test_applies_the_pattern_corretly
        assert_equal 4, Algorithms.count_letters_a_in_sequence(
          pattern: "abcabc", sequence_length: 10,
        )
        assert_equal 4, Algorithms.count_letters_a_in_sequence(
          pattern: "abcab", sequence_length: 10,
        )
      end

      def test_works_with_large_string_sequence
        assert_equal 1000000000000, Algorithms.count_letters_a_in_sequence(
          pattern: "a",
          sequence_length: 1000000000000,
        )
      end
    end
  end
end
