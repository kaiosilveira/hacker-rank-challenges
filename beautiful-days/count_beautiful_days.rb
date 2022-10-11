require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.count_beautiful_days(day0:, dayN:, divisor:)
      constraint_validation_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: "divisor", constraints: "1 <= divisor <= 10^9",
      ) if constraint_validation_enabled && is_divisor_out_of_constraints?(divisor)

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: "day0 | dayN", constraints: "1 <= day0 <= dayN <= 10^6",
      ) if constraint_validation_enabled && (
        day0 > dayN || is_day_range_out_of_constraints?(day0, dayN)
      )

      (day0..dayN).count do |n|
        reversed = n.to_s.reverse.to_i
        (n - reversed) % divisor == 0
      end
    end

    private

    def self.is_divisor_out_of_constraints?(divisor)
      divisor < 1 || divisor > 2_000_000_000
    end

    def self.is_day_range_out_of_constraints?(day0, dayN)
      [day0, dayN].any? { |n| n < 1 || n > 2_000_000 }
    end
  end
end
