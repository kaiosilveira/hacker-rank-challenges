require 'set'
require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.find_indexes(lookup_arr:, array_to_iterate:, use_zero_based_indexes: true)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == "enabled"
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'lookup_array',
        constraints: '1 <= lookup_array.size <= 100_000'
      ) if lookup_arr.size < 1 || (lookup_arr.size > 100_000 && !allow_unconstrained_arrays)

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'array_to_iterate',
        constraints: '1 <= array_to_iterate.size <= 100_000'
      ) if array_to_iterate.size < 1 || (array_to_iterate.size > 100_000 && !allow_unconstrained_arrays)

      increment = use_zero_based_indexes ? 0 : 1
      uniq_items = lookup_arr.uniq
      uniq_items_set = Set.new(lookup_arr)
      indexes = []

      for item in array_to_iterate
        if uniq_items_set.include?(item)
          index = uniq_items.index(item)
        elsif uniq_items.last > item
          index = uniq_items.size
        elsif
          index = uniq_items.bsearch_index { |existing_item| existing_item <= item }
        end

        indexes << index + increment
      end

      indexes
    end
  end
end
