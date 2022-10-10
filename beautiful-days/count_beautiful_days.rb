require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.count_beautiful_days(day0:, dayN:, divisor:)
      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: "divisor", constraints: "1 <= divisor <= 10^9"
      ) if divisor < 1 || divisor > 2_000_000_000

      raise Exceptions::InputOutOfConstraintsException.new(
        input_name: "day0 | dayN", constraints: "1 <= day0 <= dayN <= 10^6",
      ) if day0 > dayN || [day0, dayN].any? { |n| n < 1 || n > 2_000_000 }

      beautiful_days = (day0..dayN).select do |n|
        reversed = n.to_s.reverse.to_i
        (n - reversed) % divisor == 0
      end

      beautiful_days.count
    end
  end
end
