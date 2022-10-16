require "test/unit"
require_relative "./count_beautiful_days.rb"
require_relative "../_utils/algorithm-test/index.rb"

module HackerRank
  module Algorithms
    class CountBeautifulDaysTests < AlgorithmTest
      def run_with(day0:, dayN:, divisor:)
        Algorithms.count_beautiful_days(day0: day0, dayN: dayN, divisor: divisor)
      end

      def test_raises_an_exception_if_day0_is_lower_than_1
        assert_raises_out_of_constraints &-> { run_with(day0: 0, dayN: 1, divisor: 2) }
      end

      def test_raises_an_exception_if_dayN_is_lower_than_1
        assert_raises_out_of_constraints &-> { run_with(day0: 1, dayN: 0, divisor: 2) }
      end

      def test_raises_an_exception_if_day0_is_greater_than_dayN
        assert_raises_invalid_format &-> { run_with(day0: 2, dayN: 1, divisor: 2) }
      end

      def test_raises_an_exception_if_day0_is_greater_than_2_000_000
        assert_raises_out_of_constraints &-> { run_with(day0: 2_000_002, dayN: 2_000_003, divisor: 2) }
      end

      def test_raises_an_err_if_dayN_is_greater_than_2_000_000_and_ctt_v8n_enabled
        assert_raises_out_of_constraints &-> { run_with(day0: 2_000_000, dayN: 2_000_002, divisor: 2) }
      end

      def test_does_not_raise_ex_if_dayN_is_greater_than_2_000_000_and_ctt_v8n_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        run_with(day0: 20, dayN: 2_000_002, divisor: 2)
      end

      def test_raises_ex_if_divisor_is_lower_than_1
        assert_raises_out_of_constraints &-> { run_with(day0: 20, dayN: 23, divisor: 0) }
      end

      def test_raises_ex_if_divisor_is_greater_than_2_000_000_000
        assert_raises_out_of_constraints &-> { run_with(day0: 20, dayN: 23, divisor: 2_000_000_001) }
      end

      def test_raises_ex_if_divisor_is_greater_than_2_000_000_000_and_ctt_v8n_enabled
        assert_raises_out_of_constraints &-> { run_with(day0: 20, dayN: 23, divisor: 2_000_000_001) }
      end

      def test_does_not_raise_ex_if_divisor_is_greater_than_2_000_000_000_and_ctt_v8n_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        run_with(day0: 20, dayN: 23, divisor: 2_000_000_001)
      end

      def test_identifies_beautiful_days_correctly
        assert_equal 2, run_with(day0: 20, dayN: 23, divisor: 6)
      end
    end
  end
end
