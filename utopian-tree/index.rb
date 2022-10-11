require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: 2, params: 1),
  HackerRank::Samples.create_sample(expected_result: 3, params: 2),
  HackerRank::Samples.create_sample(expected_result: 6, params: 3),
  HackerRank::Samples.create_sample(expected_result: 7, params: 4),
  HackerRank::Samples.create_sample(expected_result: 14, params: 5),
]

HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.utopian_tree(n)
end
