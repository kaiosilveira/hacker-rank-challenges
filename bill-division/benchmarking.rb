require 'benchmark'
require 'securerandom'

require_relative './validate-bill-division.rb'
require_relative '../_utils/benchmark.rb'
require_relative '../_utils/chart.rb'
require_relative '../_utils/array/array.rb'

include ArrayUtils

MAX_N_SIZE = 10000

def invoke_validate_bill_division_with_bill_of_size(n)
  validate_bill_division(
    bill_items: create_array_of_random_integers(size: n + 1),
    index_of_item_anna_refused_to_eat: n / 2,
    bill_division_according_to_brian: 3
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :invoke_validate_bill_division_with_bill_of_size,
  n0: 2,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 250,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
