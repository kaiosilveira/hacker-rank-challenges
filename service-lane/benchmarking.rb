require "benchmark"
require_relative './algorithm.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/number/number.rb'
require_relative '../_utils/array/array.rb'

include NumberUtils
include ArrayUtils

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def benchmark_input_arr(n)
  HackerRank::Algorithms.find_minimum_values_in_slices(
    arr: create_array_of_random_integers(size: n, item_max: 1_000_000_000),
    slices: [[1, 1000], [2, 10]]
  )
end

def benchmark_slices(n)
  HackerRank::Algorithms.find_minimum_values_in_slices(
    arr: create_array_of_random_integers(size: 100_000, item_max: 1_000_000_000),
    slices: [
      0.upto(n) { create_array_of_random_integers(size: 2, item_max: 1_000_000_000) }
    ]
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :benchmark_slices,
  n0: 1,
  n_max: 5_000,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/result_slices.csv"
)

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :benchmark_input_arr,
  n0: 2,
  n_max: 20_000,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/result_arr.csv"
)
