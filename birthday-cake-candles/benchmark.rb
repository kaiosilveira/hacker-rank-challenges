require "benchmark"
require "securerandom"

require_relative "./count_max_items.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/chart.rb"
require_relative "../_utils/number/number.rb"
require_relative "../_utils/array/array.rb"

include NumberUtils
include ArrayUtils

MAX_N_SIZE = 100_000

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

def invoke_count_max_items_with_array_of_size(n)
  HackerRank::Algorithms.count_max_items(
    arr: create_array_of_random_integers(size: n + 1)
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_count_max_items_with_array_of_size,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
