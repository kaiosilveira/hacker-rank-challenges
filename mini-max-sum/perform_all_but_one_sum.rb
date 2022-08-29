require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.perform_all_but_one_sum(numbers:, number_to_exclude:)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == 'enabled'
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'numbers',
        constraints: '1 <= numbers.size <= 5'
      ) if numbers.size > 5 && !allow_unconstrained_arrays

      clone = numbers.clone
      clone.delete_at(clone.index(number_to_exclude))
      clone.sum
    end
  end
end
