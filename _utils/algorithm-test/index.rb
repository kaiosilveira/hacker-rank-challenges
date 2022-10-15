require 'test/unit'
require_relative '../array/array.rb'
require_relative '../exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class AlgorithmTest < Test::Unit::TestCase
      include ArrayUtils
      include HackerRank::Exceptions

      def setup
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
      end

      def teardown
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
      end

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

      def assert_raises_array_out_of_constraints(&block)
        assert_raises(Exceptions::ArrayOutOfConstraintsException, &block)
      end

      def assert_raises_incorrect_array_size(&block)
        assert_raises Exceptions::IncorrectArraySizeException do
          block.call
        end
      end

      def assert_raises_arr_out_of_min_size(&block)
        assert_raises Exceptions::ArrayOutOfMinSizeException do
          block.call
        end
      end

      def assert_raises_arr_out_of_max_size(&block)
        assert_raises Exceptions::ArrayOutOfMaxSizeException do
          block.call
        end
      end
    end
  end
end