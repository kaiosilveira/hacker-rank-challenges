require_relative '../_utils/exceptions/exceptions.rb'

include HackerRank::Exceptions

def select_chocolate_slices_matching_criteria(birth_day:, birth_month:, chocolate:)
  constrained_array_sizes_enabled = ENV["CONSTRAINED_ARRAY_SIZES_ENABLED"] == 'enabled'

  raise InvalidDayOfMonthException if birth_day < 1 || birth_day > 31
  raise InvalidMonthOfYearException if birth_month < 1 || birth_month > 12
  raise PossiblyUnboundArrayException if chocolate.size > 100 && !constrained_array_sizes_enabled

  chocolate.filter.with_index do |_, index|
    slice = chocolate.slice(index, birth_month)
    slice.sum == birth_day
  end.size
end
