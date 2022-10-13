require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.find_longest_sub_array(input_arr:)
      constraint_enforcement_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

      raise input_out_of_constraints_ex if input_arr.size < 1
      raise input_out_of_constraints_ex if input_arr.size > 100 && constraint_enforcement_enabled

      max_sub_arr = []

      current_pointer = 0
      input_arr.each.with_index do |current_number, index|
        sub_arr = [current_number]

        input_arr.reject.with_index { |_, idx| index == idx }.each do |candidate|
          sub_arr << candidate if sub_arr.all? { |i| (i - candidate).abs <= 1 }
        end

        current_pointer += 1
        max_sub_arr = sub_arr if sub_arr.size >= max_sub_arr.size
      end

      max_sub_arr.size
    end

    private

    def self.input_out_of_constraints_ex
      Exceptions::InputOutOfConstraintsException.new(
        input_name: "input_arr",
        constraints: "1 <= inpu_arr.size <= 100",
      )
    end
  end
end
