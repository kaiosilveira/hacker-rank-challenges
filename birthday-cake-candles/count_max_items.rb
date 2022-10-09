require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    def self.count_max_items(arr:)
      constraints_enabled = ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"
      if (arr.size < 1 || arr.size > 100_000) && constraints_enabled
        raise Exceptions::InputOutOfConstraintsException.new(
          input_name: "arr",
          constraints: "1 <= arr <= 100_000"
        )
      end

      arr.count(arr.max)
    end
  end
end
