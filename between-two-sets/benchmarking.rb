require "benchmark"
require_relative './algorithm.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/number/number.rb'

include NumberUtils

MAX_N_SIZE = 100

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_algorithm_n_times(n)
  HackerRank::Algorithms.algorithm_name(args: n)
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_algorithm_n_times,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
