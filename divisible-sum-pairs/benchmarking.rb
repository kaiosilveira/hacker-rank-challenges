require 'benchmark'

require_relative './get_divisible_sum_pairs.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/chart.rb'
require_relative '../_utils/number/number.rb'
require_relative '../_utils/array/array.rb'

include ArrayUtils

MAX_N_SIZE = 100

def invoke_get_divisible_sum_pairs_with_array_of_size(n)
  HackerRank::Algorithms.get_divisible_sum_pairs(
    arr: create_array_of_random_integers(size: n),
    k: [1, create_random_integer].max
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: 'invoke_get_divisible_sum_pairs_with_array_of_size'.to_sym,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
