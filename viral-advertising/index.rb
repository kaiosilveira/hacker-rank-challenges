require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 2, params: 1),
  HackerRank.create_sample(expected_result: 5, params: 2),
  HackerRank.create_sample(expected_result: 9, params: 3),
  HackerRank.create_sample(expected_result: 15, params: 4),
  HackerRank.create_sample(expected_result: 24, params: 5),
]

HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.viral_advertising(n)
end
