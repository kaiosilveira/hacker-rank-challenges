require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.count_max_items(arr:)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == "enabled"
      if arr.size < 1 || arr.size > 100_000 && !allow_unconstrained_arrays
        raise Exceptions::ArrayOutOfConstraintsException
      end

      arr.count(arr.max)
    end
  end
end
