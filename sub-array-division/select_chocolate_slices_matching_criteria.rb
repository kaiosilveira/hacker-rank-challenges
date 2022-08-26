require_relative '../_utils/exceptions/exceptions.rb'

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.select_chocolate_slices_matching_criteria(birth_day:, birth_month:, chocolate:)
      allow_unconstrained_arrays = ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] == 'enabled'
      raise InvalidDayOfMonthException if birth_day < 1 || birth_day > 31
      raise InvalidMonthOfYearException if birth_month < 1 || birth_month > 12
      raise PossiblyUnboundArrayException if chocolate.size > 100 && !allow_unconstrained_arrays

      chocolate.filter.with_index do |_, index|
        slice = chocolate.slice(index, birth_month)
        slice.sum == birth_day
      end.size
    end
  end
end
