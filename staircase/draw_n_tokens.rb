require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.draw_n_tokens(n:, token:)
      raise InputOutOfConstraintsException.new(
        input_name: "n",
        constraints: "1 <= n <= 100"
      ) if (n < 1 || n > 100) && ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

      (0..n).to_a.map { |n| token }.join('')
    end
  end
end
