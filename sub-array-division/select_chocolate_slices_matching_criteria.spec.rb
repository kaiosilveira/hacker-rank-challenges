require_relative "../_utils/algorithm-test/index.rb"
require_relative "./select_chocolate_slices_matching_criteria.rb"

module HackerRank
  module Algorithms
    class SelectChocolateSlicesMatchingCriteriaTest < AlgorithmTest
      def test_returns_zero_if_chocolate_array_is_empty
        assert_equal 0, run_with(birth_day: 1, birth_month: 1, chocolate: [])
      end

      def test_raises_an_exception_if_birth_day_is_smaller_than_one
        assert_raises_out_of_constraints &-> { run_with(birth_day: 0, birth_month: 1, chocolate: [1, 2]) }
      end

      def test_raises_an_exception_if_birth_day_is_greater_than_thirty_one
        assert_raises_out_of_constraints &-> { run_with(birth_day: 32, birth_month: 1, chocolate: [1, 2]) }
      end

      def test_raises_an_exception_if_birth_month_is_smaller_than_one
        assert_raises_out_of_constraints &-> { run_with(birth_day: 15, birth_month: 0, chocolate: [1, 2]) }
      end

      def test_raises_an_exception_if_birth_month_is_greater_than_twelve
        assert_raises_out_of_constraints &-> { run_with(birth_day: 15, birth_month: 13, chocolate: [1, 2]) }
      end

      def test_raises_an_exception_if_array_size_is_greater_than_100_and_ctt_v8n_enabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "enabled"
        chocolate = create_array_of_random_integers(size: 101)
        assert_raises_array_out_of_constraints &-> { run_with(birth_day: 15, birth_month: 10, chocolate: chocolate) }
      end

      def test_executes_if_array_length_is_greater_than_100_and_ctt_v8n_disabled
        ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"
        chocolate = create_array_of_random_integers(size: 101)
        run_with(birth_day: 15, birth_month: 10, chocolate: chocolate)
      end

      private

      def run_with(birth_day:, birth_month:, chocolate:)
        Algorithms.select_chocolate_slices_matching_criteria(
          birth_day: birth_day,
          birth_month: birth_month,
          chocolate: chocolate,
        )
      end
    end
  end
end
