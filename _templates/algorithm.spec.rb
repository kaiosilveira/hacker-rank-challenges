require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class AlgorithmTests < Test::Unit::TestCase
      include HackerRank::Exceptions

      def test_works
        assert_equal 1, 1
      end
    end
  end
end
