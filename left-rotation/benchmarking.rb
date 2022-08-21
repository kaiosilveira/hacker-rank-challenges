require "benchmark"

require_relative "./left-rotation.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/chart.rb"

MAX_N_SIZE = 100000

def create_array_of_integers(n)
  (0..n).to_a
end

def invoke_perform_left_rotation_with_array_of_size(n)
  perform_left_rotation(2, create_array_of_integers(n))
end

BenchmarkUtils.benchmarking_n_times(
  method(:invoke_perform_left_rotation_with_array_of_size),
  n0: 0,
  n_max: MAX_N_SIZE
) do |n_values, time_results|
  results = ChartUtils.prepare_chart_data_with(
    x_axis: n_values,
    y_axis: time_results,
    max_x_size: MAX_N_SIZE,
    step: 2500
  )

  BenchmarkUtils.write_benchmark_results_to_csv(
    filename: './results.csv',
    x_label: 'n',
    y_label: 'T(n)',
    data: results
  )
end
