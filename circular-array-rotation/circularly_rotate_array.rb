require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.circularly_rotate_array(input:, rotations: 1)
      clone = input.clone
      rotations.times { clone = clone.unshift(clone.pop) }
      clone
    end
  end
end
