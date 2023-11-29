require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.find_minimum_values_in_slices(arr:, slices:)
      return [] unless arr.any?
      return [] unless slices.any?
      slices.map { |first, last| arr.slice(first..last).min }
    end
  end
end
