require "benchmark"
require_relative "./algorithm.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/number/number.rb"
require_relative "../_utils/array/array.rb"

include NumberUtils
include ArrayUtils

MAX_N_SIZE = 1000

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_algorithm_n_times(n)
  HackerRank::Algorithms.find_longest_sub_array(
    input_arr: create_array_of_random_integers(size: n, item_max: 100),
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_algorithm_n_times,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv",
)
