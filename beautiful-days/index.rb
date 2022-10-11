require_relative "./challenge.rb"
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 2, params: [20, 23, 6]),
]

HackerRank::Runner.new(samples).run do |i, j, k|
  HackerRank::Challenges.beautiful_days(i, j, k)
end
