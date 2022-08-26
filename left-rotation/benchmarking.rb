require "benchmark"

require_relative "./perform_left_rotation.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/chart.rb"

MAX_N_SIZE = 100_000

def create_array_of_integers(n)
  (0..n).to_a
end

def invoke_perform_left_rotation_with_array_of_size(n)
  HackerRank::Algorithms.perform_left_rotation(offset: 2, array: create_array_of_integers(n))
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_perform_left_rotation_with_array_of_size,
  n0: 2,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 2500,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
