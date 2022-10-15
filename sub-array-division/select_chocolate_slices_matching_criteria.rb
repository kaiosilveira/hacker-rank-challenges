require_relative "../_utils/exceptions/exceptions.rb"
require_relative "../_utils/validation/index.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions
    include HackerRank::Validation

    def self.select_chocolate_slices_matching_criteria(birth_day:, birth_month:, chocolate:)
      Validation.validate_day_of_month(input_name: "birth_day", value: birth_day)
      Validation.validate_month_of_year(input_name: "birth_month",value: birth_month)
      Validation.ensure_max_array_size(input_name: 'chocolate', value: chocolate, max_size: 100)

      chocolate.filter.with_index do |_, index|
        slice = chocolate.slice(index, birth_month)
        slice.sum == birth_day
      end.size
    end
  end
end
