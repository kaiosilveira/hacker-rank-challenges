require_relative '../_utils/benchmark.rb'
require_relative './calculate_cumulative_likes.rb'

MAX_N_SIZE = 10_000
ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def execute_calculate_cumulative_likes_with_nth_day_as(n)
  HackerRank::Algorithms.calculate_cumulative_likes_for_nth_day(n: n)
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :execute_calculate_cumulative_likes_with_nth_day_as,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 10,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
