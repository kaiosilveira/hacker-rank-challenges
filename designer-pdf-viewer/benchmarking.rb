require_relative "./calculate_rect_area.rb"
require_relative "../_utils/benchmark.rb"
require_relative "../_utils/array/array.rb"

include ArrayUtils

MAX_N_SIZE = 1_000_000
ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def execute_calculate_rect_area_n_times(n)
  HackerRank::Algorithms.calculate_rect_area(
    char_heights: create_array_of_random_integers(size: 26, item_max: 7).map { |n| n == 0 ? 1 : n },
    word: 'abcab'
  )
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :execute_calculate_rect_area_n_times,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv",
)
