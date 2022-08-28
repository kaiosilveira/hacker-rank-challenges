require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: 58, params: [[40, 50, 60], [5, 8, 12], 60]),
  HackerRank::Samples.create_sample(expected_result: 9, params: [[3, 1], [5, 2, 8], 10]),
  HackerRank::Samples.create_sample(expected_result: -1, params: [[4], [5], 5]),
]

HackerRank::Runner.new(samples).run do |*params|
  keyboards, drives, budget = params
  HackerRank::Challenges.get_money_spent(keyboards, drives, budget)
end
