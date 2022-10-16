require_relative "../_utils/exceptions/exceptions.rb"
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions
    include HackerRank::Validation

    def self.count_beautiful_days(day0:, dayN:, divisor:)
      constraint_validation_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

      validate_divisor(divisor)

      Validation.ensure_constraint_is_within_range(
        constraint_name: "day0",
        constraint_value: day0,
        range: [1, 1_000_000],
      )

      Validation.ensure_constraint_is_within_range(
        constraint_name: "dayN",
        constraint_value: dayN,
        range: [1, 1_000_000],
      )

      raise Exceptions::InvalidInputFormatException.new(
        input_name: "day0 | dayN", expected_format: "day0 <= dayN"
      ) if day0 > dayN

      (day0..dayN).count do |n|
        reversed = n.to_s.reverse.to_i
        (n - reversed) % divisor == 0
      end
    end

    private

    def self.validate_divisor(divisor)
      Validation.ensure_constraint_is_within_range(
        constraint_name: "divisor",
        constraint_value: divisor,
        range: [1, 1_000_000_000],
      )
    end
  end
end
