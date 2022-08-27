require "benchmark"
require "securerandom"

require_relative "./find_indexes.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/array/array.rb"

include ArrayUtils

MAX_N_SIZE = 200_000

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

def invoke_find_indexes_with_array_of_size(n)
  HackerRank::Algorithms.find_indexes(
    lookup_arr: create_array_of_random_integers(size: n, item_max: 1_000_000_000),
    array_to_iterate: create_array_of_random_integers(size: n, item_max: 1_000_000_000)
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_find_indexes_with_array_of_size,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
