require_relative './circularly_rotate_array.rb'
require_relative "../_utils/validation/index.rb"

module HackerRank  
  module Challenges
    include HackerRank::Validation

    def self.circular_array_rotation(input:, number_of_rotations:, queries:)
      validate_circular_array_rotation_inputs(input, number_of_rotations, queries)

      rotated = Algorithms.circularly_rotate_array(input: input, rotations: number_of_rotations)
      queries.map { |query| rotated[query] }
    end

    private

    def self.validate_circular_array_rotation_inputs(arr, number_of_rotations, queries)
      Validation.ensure_is_array(arr: arr, input_name: "input")
      Validation.ensure_array_constraints(input_name: 'input', value: arr, constraints: [1, 10**5])

      Validation.ensure_constraint_is_within_range(
        constraint_name: "number_of_rotations",
        constraint_value: number_of_rotations,
        range: [1, 10**5],
      )

      Validation.ensure_is_array(arr: queries, input_name: "queries")
      Validation.ensure_array_constraints(
        input_name: 'queries',
        value: queries,
        constraints: [1, 500]
      )
    end
  end
end
