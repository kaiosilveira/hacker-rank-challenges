require_relative "../exceptions/exceptions.rb"

module HackerRank
  module Validation
    include HackerRank::Exceptions

    def self.ensure_constraint_is_within_range(constraint_name:, constraint_value:, range:)
      constraint_enforcement_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"
      min, max = range
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: constraint_name,
        constraints: "#{min} <= #{constraint_name} <= #{max}",
      ) if constraint_value < min || (constraint_value > max && constraint_enforcement_enabled)
    end

    def self.ensure_is_array(arr:, input_name:)
      raise Exceptions::InvalidInputTypeException.new(
        input_name: input_name,
        expected_type: "array",
      ) if !arr.kind_of?(Array)
    end

    def self.ensure_min_array_size(input_name:, value:, min_size:)
      raise Exceptions::ArrayOutOfMinSizeException.new(
        input_name: input_name,
        min_size: min_size,
        actual_size: value.size,
      ) if value.size < min_size
    end

    def self.ensure_max_array_size(input_name:, value:, max_size:)
      constraint_enforcement_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"
      raise Exceptions::ArrayOutOfMaxSizeException.new(
        input_name: input_name,
        max_size: max_size,
        actual_size: value.size,
      ) if value.size > max_size && constraint_enforcement_enabled
    end

    def self.ensure_array_constraints(input_name:, value:, constraints:)
      min, max = constraints
      ensure_min_array_size(input_name: input_name, value: value, min_size: min)
      ensure_max_array_size(input_name: input_name, value: value, max_size: max)
    end

    def self.ensure_fixed_array_size(input_name:, value:, size:)
      raise Exceptions::IncorrectArraySizeException.new(
        input_name: input_name,
        expected_size: size,
        actual_size: value.size,
      ) if value.size != size
    end

    def self.ensure_is_day_of_month(input_name:, value:)
      ensure_constraint_is_within_range(
        constraint_name: input_name,
        constraint_value: value,
        range: [1, 31],
      )
    end

    def self.ensure_is_month_of_year(input_name:, value:)
      ensure_constraint_is_within_range(
        constraint_name: input_name,
        constraint_value: value,
        range: [1, 12]
      )
    end
  end
end
