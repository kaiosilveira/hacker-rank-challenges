require_relative '../exceptions/exceptions.rb'

module HackerRank
  module Validation
    include HackerRank::Exceptions

    def self.validate_constraint_within_range(constraint_name:, constraint_value:, range:)
      min, max = range
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: constraint_name,
        constraints: "#{min} <= #{constraint_name} <= #{max}",
      ) if constraint_value < min || constraint_value > max
    end

    def self.validate_array(arr:, input_name:)
      raise Exceptions::InvalidInputTypeException.new(
        input_name: input_name,
        expected_type: "array",
      ) if !arr.kind_of?(Array)
    end

    def self.ensure_max_array_size(input_name:, value:, max_size:)
      constraint_enforcement_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"
      raise ArrayOutOfConstraintsException.new(
        input_name: input_name,
        expected_max_size: max_size,
        actual_size: value.size
      ) if value.size > max_size && constraint_enforcement_enabled
    end

    def self.validate_array_length(arr:, input_name:, expected_format:)
      raise Exceptions::InvalidInputFormatException.new(
        input_name: input_name,
        expected_format: expected_format,
      ) if arr.size != 3
    end

    def self.validate_day_of_month(input_name:, value:)
      validate_constraint_within_range(
        constraint_name: input_name,
        constraint_value: value,
        range: [1, 31],
      )
    end

    def self.validate_month_of_year(input_name:, value:)
      validate_constraint_within_range(
        constraint_name: input_name,
        constraint_value: value,
        range: [1, 12],
      )
    end
  end
end
