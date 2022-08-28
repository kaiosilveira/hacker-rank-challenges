require "benchmark"
require "securerandom"

require_relative "./get_closest_or_default.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/chart.rb"
require_relative "../_utils/number/number.rb"
require_relative "../_utils/array/array.rb"

include NumberUtils
include ArrayUtils

MAX_N_SIZE = 1_000_000

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

def invoke_get_closest_or_default_items_of_size(n)
  itemA = { position: n, label: 'Item A' }
  itemB = { position: n, label: 'Item B' }
  target = { position: create_random_integer(max: 100), label: 'Target' }

  HackerRank::Algorithms.get_closest_or_default(itemA: itemA, itemB: itemB, target: target)
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_get_closest_or_default_items_of_size,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
