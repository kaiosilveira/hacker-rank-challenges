require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: "16 24", params: [1, 3, 5, 7, 9]),
  HackerRank::Samples.create_sample(expected_result: "10 14", params: [1, 2, 3, 4, 5]),
]

HackerRank::Runner.new(samples).run do |*params|
  HackerRank::Challenges.mini_max_sum(params)
end
