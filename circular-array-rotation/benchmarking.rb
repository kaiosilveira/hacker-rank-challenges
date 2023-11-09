require "benchmark"
require_relative './circularly_rotate_array.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/array/array.rb'

include ArrayUtils

MAX_N_SIZE = 10000

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_algorithm_n_times(n)
  HackerRank::Algorithms.circularly_rotate_array(
    input: create_array_of_random_integers(size: n),
    rotations: 2
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_algorithm_n_times,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
