require_relative './draw_n_tokens.rb'
require_relative '../_utils/benchmark.rb'

MAX_N_SIZE = 100_000
ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] = "disabled"

def execute_draw_n_tokens_with_n_of_size(n)
  HackerRank::Algorithms.draw_n_tokens(n: n, token: '#')
end

HackerRank::Benchmarking.create_time_complexity_analysis(
  method_name: :execute_draw_n_tokens_with_n_of_size,
  n0: 1,
  n_max: MAX_N_SIZE,
  n_incrementation_step: 1000,
  file_name: "#{File.expand_path File.dirname(__FILE__)}/results.csv"
)
