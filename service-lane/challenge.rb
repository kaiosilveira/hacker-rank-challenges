require_relative "./algorithm.rb"
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Challenges
    def self.service_lane(input:, cases:)
      validate_service_lane_inputs(input, cases)
      Algorithms.find_minimum_values_in_slices(arr: input, slices: cases)
    end

    private

    def self.validate_service_lane_inputs(input, cases)
      Validation.ensure_is_array(arr: input, input_name: "input")
      Validation.ensure_array_constraints(
        input_name: 'input', value: input, constraints: [2, 10**4]
      )

      Validation.ensure_is_array(arr: cases, input_name: "cases")
      Validation.ensure_array_constraints(
        input_name: 'cases', value: cases, constraints: [1, 1000]
      )
    end
  end
end
