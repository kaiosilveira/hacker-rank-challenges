require_relative './algorithm.rb'
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Challenges
    def self.angry_professor(arrival_times:, threshold:)
      validate_inputs(arrival_times, threshold)
      Algorithms.was_class_canceled?(
        arrival_times: arrival_times,
        threshold: threshold
      ) ? 'YES' : 'NO'
    end

    private
    
    def self.validate_inputs(arrival_times, threshold)
      Validation.ensure_is_array(arr: arrival_times, input_name: "arrival_times")
      Validation.ensure_array_constraints(
        input_name: 'arrival_times', value: arrival_times, constraints: [1, 1000]
      )
    end
  end
end
