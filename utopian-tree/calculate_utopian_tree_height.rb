require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.calculate_utopian_tree_height(number_of_cycles:)
      constraint_enforcement_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: 'cycle_number',
        constraints: '0 <= cycle_number <= 60'
      ) if constraint_enforcement_enabled && (number_of_cycles < 1 || number_of_cycles > 60)

      result = 1

      (1..number_of_cycles).each do |current_cycle|
        result += 1 if current_cycle.even?
        result *= 2 if current_cycle.odd?
      end

      result
    end
  end
end
