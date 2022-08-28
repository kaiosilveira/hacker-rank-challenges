require "benchmark"
require "securerandom"

require_relative "./find_max_sum.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/array/array.rb"
require_relative "../_utils/number/number.rb"

include ArrayUtils
include NumberUtils

MAX_N_SIZE = 10_000

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

def invoke_find_max_sum_with_array_of_size(n)
  HackerRank::Algorithms.find_max_sum(
    limit: create_random_integer(max: 1_000_000),
    first_array: create_array_of_random_integers(size: n, item_max: 1_000_000),
    second_array: create_array_of_random_integers(size: n, item_max: 1_000_000),
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_find_max_sum_with_array_of_size,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
