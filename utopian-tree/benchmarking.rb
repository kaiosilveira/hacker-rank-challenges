require "benchmark"
require_relative './calculate_utopian_tree_height.rb'
require_relative '../_utils/benchmark.rb'

MAX_N_SIZE = 100_000

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_calculate_utopian_tree_height_with_n_number_of_cycles(n)
  HackerRank::Algorithms.calculate_utopian_tree_height(number_of_cycles: n)
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_calculate_utopian_tree_height_with_n_number_of_cycles,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1_000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
