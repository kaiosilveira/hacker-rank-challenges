require "benchmark"
require "securerandom"

require_relative "./perform_all_but_one_sum.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/array/array.rb"
require_relative "../_utils/number/number.rb"

include ArrayUtils
include NumberUtils

MAX_N_SIZE = 50

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

def invoke_perform_all_but_one_sum_with_array_of_size(n)
  random_index = create_random_integer(max: n)
  numbers = create_array_of_random_integers(size: n, item_max: 1_000_000_000)
  HackerRank::Algorithms.perform_all_but_one_sum(
    numbers: numbers,
    number_to_exclude: numbers[random_index]
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_perform_all_but_one_sum_with_array_of_size,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
