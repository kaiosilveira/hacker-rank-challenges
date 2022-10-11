require "benchmark"
require_relative './count_beautiful_days.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/number/number.rb'

include NumberUtils

MAX_N_SIZE = 2_000_000

ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def invoke_count_beautiful_days_with_range_of_size(n)
  HackerRank::Algorithms.count_beautiful_days(
    day0: 1,
    dayN: n,
    divisor: NumberUtils.create_random_integer(max: 2_000_000_000)
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_count_beautiful_days_with_range_of_size,
  n0: 2,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 100_000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
