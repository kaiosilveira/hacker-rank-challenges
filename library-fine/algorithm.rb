require_relative "../_utils/exceptions/exceptions.rb"
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions
    include HackerRank::Validation

    DAILY_FEE = 15
    MONTHLY_FEE = 500
    YEARLY_FEE = 10_000

    def self.calculate_library_fine(expected_date:, date_returned:)
      validate_inputs(date_returned, expected_date)

      actual_day, actual_month, actual_year = date_returned
      expected_day, expected_month, expected_year = expected_date

      return 0 if actual_year < expected_year
      return YEARLY_FEE * (actual_year - expected_year) if actual_year > expected_year

      return 0 if actual_month < expected_month
      return MONTHLY_FEE * (actual_month - expected_month) if actual_month > expected_month

      return DAILY_FEE * (actual_day - expected_day) if actual_day > expected_day
      return 0
    end

    private

    def self.validate_inputs(actual_return_date, expected_return_date)
      Validation.ensure_is_array(arr: actual_return_date, input_name: "actual_return_date")
      Validation.ensure_is_array(arr: expected_return_date, input_name: "expected_return_date")

      validate_date_input_format(arr: actual_return_date, name: "actual_return_date")
      validate_date_input_format(arr: expected_return_date, name: "expected_return_date")

      actual_day, actual_month, actual_year = actual_return_date
      expected_return_day, expected_return_month, expected_return_year = expected_return_date

      Validation.ensure_is_day_of_month(input_name: "actual_day", value: actual_day)
      Validation.ensure_is_day_of_month(input_name: "expected_return_day", value: expected_return_day)

      Validation.ensure_is_month_of_year(input_name: "actual_month", value: actual_month)
      Validation.ensure_is_month_of_year(input_name: "expected_return_month", value: expected_return_month)

      validate_year(input_name: "actual_year", value: actual_year)
      validate_year(input_name: "expected_return_year", value: expected_return_year)
    end

    def self.validate_date_input_format(arr:, name:)
      Validation.ensure_array_length(
        arr: arr,
        input_name: name,
        expected_format: "[day, month, year]",
      )
    end

    def self.validate_year(input_name:, value:)
      Validation.ensure_constraint_is_within_range(
        constraint_name: input_name,
        constraint_value: value,
        range: [1, 3000],
      )
    end
  end
end
