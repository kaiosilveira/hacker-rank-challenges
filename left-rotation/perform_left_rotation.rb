require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.perform_left_rotation(offset:, array:)
      if array.size < 1 || array.size > 100_000
        raise HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'array',
          constraints: '1 <= array.size <= 100_000'
        )
      end

      if offset < 1 || offset > array.size
        raise HackerRank::Exceptions::InputOutOfConstraintsException.new(
          input_name: 'offset',
          constraints: '1 <= offset <= array.size'
        )
      end

      (0..array.size - 1).map { |n| array[(n + offset) % array.size] }
    end
  end
end
