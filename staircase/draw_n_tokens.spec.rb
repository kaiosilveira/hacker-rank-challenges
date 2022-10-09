require 'test/unit'
require_relative './draw_n_tokens.rb'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    class DrawNTokensTest < Test::Unit::TestCase
      include HackerRank::Exceptions

      def test_raises_an_exception_if_n_is_lower_than_0
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises InputOutOfConstraintsException do
          Algorithms.draw_n_tokens(n: -1, token: '#')
        end
      end

      def test_raises_exception_if_n_is_greater_than_100_and_constraint_enforcement_is_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        assert_raises InputOutOfConstraintsException do
          Algorithms.draw_n_tokens(n: 101, token: '#')
        end
      end

      def test_does_not_raise_an_exception_if_n_is_greater_than_100_and_constraint_enforcement_is_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        Algorithms.draw_n_tokens(n: 101, token: '#')
      end

      def test_returns_the_correct_number_of_tokens
        assert_equal '####', Algorithms.draw_n_tokens(n: 3, token: '#')
      end
    end
  end
end
