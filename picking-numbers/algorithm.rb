require_relative "../_utils/exceptions/exceptions.rb"
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions
    include HackerRank::Validation

    def self.find_longest_sub_array(input_arr:)
      Validation.ensure_array_constraints(
        input_name: 'input_arr', value: input_arr, constraints: [1, 100]
      )

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
  end
end
