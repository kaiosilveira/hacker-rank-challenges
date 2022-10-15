require "benchmark"
require_relative './algorithm.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/number/number.rb'

include NumberUtils

MAX_N_SIZE = 100_000

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_algorithm(_)
  HackerRank::Algorithms.calculate_library_fine(expected_date: [5, 7, 2017], date_returned: [5, 7, 2018])
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_algorithm,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 100,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
