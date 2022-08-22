require_relative '../_utils/benchmark.rb'
require_relative '../_utils/array/array.rb'

include ArrayUtils
include BenchmarkUtils

MAX_N_SIZE = 10000

def execute_simple_array_sum_with_array_of_size(n)
  simple_array_sum(ArrayUtils.create_array_of_random_integers(size: n))
end

BenchmarkUtils.create_time_complexity_analysis(
  method_name: :execute_simple_array_sum_with_array_of_size,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
