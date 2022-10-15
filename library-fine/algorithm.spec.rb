require "test/unit"
require_relative "./algorithm.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    class CalculateLibraryFineTests < AlgorithmTest
      def test_raises_exception_if_date_returned_is_not_an_array
        assert_raises_invalid_type &-> { run_with(expected_date: [5, 7, 2018], date_returned: 3) }
      end

      def test_raises_exception_if_expected_date_is_not_an_array
        assert_raises_invalid_type &-> { run_with(expected_date: 3, date_returned: [5, 7, 2018]) }
      end

      def test_raises_exception_if_date_returned_does_not_contain_three_items
        assert_raises_invalid_format &-> { run_with(expected_date: [5, 7, 2018], date_returned: [3]) }
      end

      def test_raises_exception_if_expected_date_does_not_contain_three_items
        assert_raises_invalid_format &-> { run_with(expected_date: [3], date_returned: [5, 7, 2018]) }
      end

      def test_raises_exception_if_actual_return_day_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 7, 2018], date_returned: [0, 7, 2018]) }
      end

      def test_raises_exception_if_actual_return_day_is_greater_than_thirty_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 7, 2018], date_returned: [32, 7, 2018]) }
      end

      def test_raises_exception_if_expected_return_day_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [0, 7, 2018], date_returned: [5, 7, 2018]) }
      end

      def test_raises_exception_if_expected_return_day_is_greater_than_thirty_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [32, 7, 2018], date_returned: [5, 7, 2018]) }
      end

      def test_raises_exception_if_actual_return_month_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 7, 2018], date_returned: [1, 0, 2018]) }
      end

      def test_raises_exception_if_expected_return_month_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 0, 2018], date_returned: [1, 1, 2018]) }
      end

      def test_raises_exception_if_actual_return_month_is_greater_than_twelve
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 7, 2018], date_returned: [1, 13, 2018]) }
      end

      def test_raises_exception_if_expected_return_month_is_greater_than_twelve
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 13, 2018], date_returned: [1, 12, 2018]) }
      end

      def test_raises_exception_if_actual_return_year_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 12, 2018], date_returned: [1, 12, 0]) }
      end

      def test_raises_exception_if_expected_return_year_is_lower_than_one
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 12, 0], date_returned: [1, 12, 2018]) }
      end

      def test_raises_exception_if_actual_return_year_is_greater_than_three_thousand
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 12, 2018], date_returned: [1, 12, 3001]) }
      end

      def test_raises_exception_if_expected_return_year_is_greater_than_three_thousand
        assert_raises_out_of_constraints &-> { run_with(expected_date: [5, 12, 3001], date_returned: [1, 12, 2018]) }
      end

      def test_returns_zero_if_there_is_no_fine
        assert_equal 0, run_with(expected_date: [5, 7, 2018], date_returned: [5, 7, 2018])
        assert_equal 0, run_with(expected_date: [5, 7, 2018], date_returned: [5, 6, 2018])
        assert_equal 0, run_with(expected_date: [5, 7, 2019], date_returned: [5, 7, 2018])
        assert_equal 0, run_with(expected_date: [1, 1, 2019], date_returned: [2, 7, 2018])
      end

      def test_calculates_fine_for_n_days_late
        assert_equal 135, run_with(expected_date: [5, 7, 2018], date_returned: [14, 7, 2018])
      end

      def test_calculates_fine_for_two_months_late
        assert_equal 1000, run_with(expected_date: [5, 7, 2018], date_returned: [4, 9, 2018])
      end

      def test_calculates_fine_for_n_years_late
        assert_equal 20_000, run_with(expected_date: [5, 7, 2018], date_returned: [4, 7, 2020])
      end

      private

      def run_with(expected_date:, date_returned:)
        Algorithms.calculate_library_fine(expected_date: expected_date, date_returned: date_returned)
      end
    end
  end
end
