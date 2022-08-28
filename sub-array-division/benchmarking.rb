require_relative '../_utils/benchmark.rb'
require_relative '../_utils/array/array.rb'
require_relative './select_chocolate_slices_matching_criteria.rb'

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"
MAX_N_SIZE = 100_000

include ArrayUtils

def execute_sub_array_division_with_array_of_size(n)
  HackerRank::Algorithms.select_chocolate_slices_matching_criteria(
    birth_day: 4,
    birth_month: 2,
    chocolate: ArrayUtils.create_array_of_random_integers(size: n)
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :execute_sub_array_division_with_array_of_size,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
