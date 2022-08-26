require_relative '../_utils/array/array.rb'

module HackerRank
  module Algorithms
    def self.array_sum(arr)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == "enabled"
      if arr.size > 10_000 && !allow_unconstrained_arrays
        raise HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'array',
          constraints: '1 <= array.size <= 10_000'
        )
      end

      arr.sum
    end
  end
end
