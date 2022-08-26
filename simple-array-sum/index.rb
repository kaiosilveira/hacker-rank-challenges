require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 6, params: [[1, 2, 3]]),
  HackerRank.create_sample(expected_result: 31, params: [[1, 2, 3, 4, 10, 11]]),
]

HackerRank::Runner.new(samples).run do |params|
  HackerRank::Challenges.simple_array_sum(params)
end
