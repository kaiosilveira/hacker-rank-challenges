require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.was_class_canceled?(arrival_times:, threshold:)
      on_time_arrivals = arrival_times.count { |time| time <= 0 }
      on_time_arrivals < threshold
    end
  end
end
