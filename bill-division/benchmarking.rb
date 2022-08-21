require "benchmark"
require "securerandom"

require_relative "./validate-bill-division.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/chart.rb"

MAX_N_SIZE = 10000

def create_array_of_random_integers(n)
  (0..n).to_a.map { SecureRandom.random_number(10000) }
end

def invoke_validate_bill_division_with_bill_of_size(n)
  validate_bill_division(
    bill_items: create_array_of_random_integers(n+1),
    index_of_item_anna_refused_to_eat: n / 2,
    bill_division_according_to_brian: 3
  )
end

BenchmarkUtils.benchmarking_n_times(
  method(:invoke_validate_bill_division_with_bill_of_size),
  n0: 0,
  n_max: MAX_N_SIZE
) do |n_values, time_results|
  results = ChartUtils.prepare_chart_data_with(
    x_axis: n_values,
    y_axis: time_results,
    max_x_size: MAX_N_SIZE,
    step: 250
  )

  BenchmarkUtils.write_benchmark_results_to_csv(
    filename: "#{File.expand_path File.dirname(__FILE__)}/results.csv",
    x_label: 'n',
    y_label: 'T(n)',
    data: results
  )
end
