require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: 5, params: [6, 3, [1, 3, 2, 6, 1, 2]]),
]

HackerRank::Runner.new(samples).run do |*params|
  n, k, arr = params
  HackerRank::Challenges.divisible_sum_pairs(n, k, arr)
end
