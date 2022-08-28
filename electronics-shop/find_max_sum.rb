require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.find_max_sum(limit:, first_array:, second_array:)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == 'enabled'

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'first_array',
        constraints: '1 <= first_array.size <= 1000'
      ) if first_array.size > 1000 && !allow_unconstrained_arrays

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'second_array',
        constraints: '1 <= second_array.size <= 1000'
      ) if second_array.size > 1000 && !allow_unconstrained_arrays

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'limit',
        constraints: '1 <= limit <= 1_000_000'
      ) if limit < 1 || limit > 1_000_000

      max_sum = -1

      for item in first_array
        for itm in second_array
          sum = item + itm
          max_sum = sum if sum > max_sum && sum <= limit
        end
      end

      max_sum
    end
  end
end
