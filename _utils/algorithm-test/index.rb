module HackerRank
  module Algorithms
    class AlgorithmTest < Test::Unit::TestCase
      include HackerRank::Exceptions

      protected

      def assert_raises_invalid_type(&block)
        assert_raises(Exceptions::InvalidInputTypeException, &block)
      end

      def assert_raises_invalid_format(&block)
        assert_raises(Exceptions::InvalidInputFormatException, &block)
      end

      def assert_raises_out_of_constraints(&block)
        assert_raises(Exceptions::InputOutOfConstraintsException, &block)
      end
    end
  end
end